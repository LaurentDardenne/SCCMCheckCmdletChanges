#SCCMCheckCmdletChanges.psm1

[string[]]$script:KeysName=@(
   'LibraryChangesForVersion',
   'Url'
)

[string[]]$script:KeysNameArrayType=@(
   'RemovedCmdletNames',
   'RemovedAliasNames',
   'DeprecatedCommandNames',
   'UnresolvedBugCommandNames',
   'ChangedCommandNames',
   'BreakingChangesCommandNames'
)
[string[]]$script:KeysNameMustExist=@($script:KeysNameArrayType+$script:KeysName)

Function New-SCCMCommandReleaseNote{
<#
Define an SCCM release object
Each command present in a release note can be cited there for different reasons.
You must specify at least one case of modification

The returned object carries only brief information, only the text of the 'release note' contains all the related explanations.
#>
    param(
          [Parameter(Mandatory=$True,position=0)]
          #Configuration Manager Current Branch version
        $Version,

          [Parameter(Mandatory=$True,position=1)]
          #Command name
        [string] $Name,

          [Parameter(position=2)]
          [ValidateSet('Cmdlet','Alias')]
        $Type,

          [Parameter(position=3)]
        $Path,

        #Indicates that the command has been deleted.
        [switch] $Removed,

        #Indicates that the command is obsolete (use is deprecated).
        [switch] $Deprecated,

        #Indicates that the command contains a bug that has not been fixed.
        [switch] $UnResolvedBug,

        #Indicates that the command has been modified.
        [switch] $Changed,

        #Indicates that the command brings a breaking change (several possible reasons, modification/deletion).
        [switch] $BreakingChange
    )

    #At least one case must be specified
    $NoneOfTheCases=$null -eq ($Changed,$UnResolvedBug,$Removed,$Deprecated,$BreakingChange|
                      Where-Object {$_.isPresent}|
                      Select-Object -First 1)
    if ($NoneOfTheCases)
    { Throw "You must specify at least one modification type for command name '$Name'."}

    [pscustomobject]@{
     PSTypeName='SCCMCommandReleaseNote';
     Version=$Version;
     Name=$Name;
     Type=$Type;
     Path=$Path;
     isRemoved=$Removed.isPresent;
     isDeprecated=$Deprecated.isPresent;
     isUnResolvedBug=$UnResolvedBug.isPresent;
     isChanged=$Changed.isPresent;
     isBreakingChange=$BreakingChange.isPresent;
    }
}

Function Test-SccmVersion {
  #Validate a SCCM release version number 
  #By default return a boolean. 

  #Different update versions are identified by year and month. For example, version 1511 identifies November 2015.
  param ( 
    [parameter(Mandatory=$true, Position=1, ValueFromPipeline=$true)]
    [AllowEmptyString()]
    [AllowNull()]
    [string] $InputObject,
     
     #Return only the invalid versions number
    [switch] $PassThru
  )
  Begin {
    $Pattern='^(?<Year>\d{2})(?<Month>\d{2})$'
  }
  process {
    $Result=$InputObject -match $Pattern
    if ($Result)
    { 
      if (($Matches.Month -as [Int]) -notIn (1..12) )
      { $Result=$false }
    }

    if ($PassThru)
    {
      if ($Result -eq $false)
      { $InputObject }
    }
    else
    { $Result }
  }
}

Function Get-InvalidVersionNumber{
  param ( [string[]] $Version)

  $Version |Test-SccmVersion -PassThru
}

Function Test-ReleaseNoteRequirement{
  param(
    $Datas,
    $FileName
  )

 try {
  $oldOFS,$ofs=$OFS,','

  $KeysToCompare=[string[]]$Datas.Keys
  $Groups=Compare-Object $script:KeysNameMustExist $KeysToCompare -IncludeEqual|Group-Object 'SideIndicator' -AsHashTable

    #Pas de différence
  if ($Groups.'=='.Count -ne $KeysNameMustExist.Count)
  {
      #One or more required keys do not exist
      #not present in the list
    if ($Groups.'<='.Count -gt 0)
    { Throw ("The required keys do not exist : {0} . Release note file '{1}'" -F $Groups.'<='.InputObject,$FileName) }
     #The required keys exist,
     #the compared collection contains one or more additional keys
    if ($Groups.'=>'.Count -gt 0)
    { Write-Warning ("The following are not managed : {0} . Release note file '{1}'" -F $Groups.'=>'.InputObject,$FileName) }
  }

  #Test requirements
  $ReleaseVersion=$Datas.LibraryChangesForVersion
  if ((Test-SccmVersion -InputObject $ReleaseVersion) -eq $false)
  { Throw ("The key 'LibraryChangesForVersion' must contains an integer (four digits in format 'yyMM') : {0} . Release note file '{1}'" -F $ReleaseVersion,$FileName) }

  $Uri=[Uri]$Datas.Url
  if ( ($Uri.Scheme -notmatch 'Http') -or ($Uri.IsAbsoluteUri -ne $true) )
  { Throw ("The key 'Url' must contains an URL. Release note file '{1}'" -F $Datas.Url,$FileName) }

  Foreach ($Current in $script:KeysNameArrayType)
  {
    if ( ($null -eq $Datas.$Current) -or ($Datas.$Current -isnot [System.Array]) ) 
    { Throw ("The key '$Current' must be of type Array. Release note file '{1}'" -F $Current,$FileName)} 
  }

 } finally {
  $OFS=$oldOFS
 }
}

Function Get-SCCMCommandReleaseNote{
   param(
     [AllowNull()]
     [string[]] $Version
   )

   $isFilteredByVersion=$PSBoundParameters.ContainsKey('Version') -and ($null -ne $Version) -and ($Version.Count -gt 0)
   if ($isFilteredByVersion)
   {
      $InvalidVersion=@(Get-InvalidVersionNumber -Version $Version)
      if ($InvalidVersion.Count -gt 0)
      { Throw "The following version numbers are invalid : $InvalidVersion"} 
   }

   $ReleaseNotes=[System.Collections.ArrayList]::New()

   $Files=@(Get-ChildItem -path "$PSScriptRoot\Datas\ReleaseNotes*.psd1")
   If ($Files.Count -eq 0)
   { Throw "No ReleaseNotes file found in the folder '$PSScriptRoot\Datas'"}
   
   Foreach ($DataFile in $Files)
   {
        try {
          Write-Debug "Read $DataFile"

          $Datas=Import-PowerShellDataFile $DataFile -ErrorAction Stop
        } catch [System.InvalidOperationException] 
        { 
           Write-Error $_  
           Continue
        } 

        Test-ReleaseNoteRequirement -Datas $Datas -FileName $Datafile
        $CurrentRelease=$Datas.LibraryChangesForVersion
        if ( $isFilteredByVersion -and ($CurrentRelease -NotIn $Version) )
        { Continue }
        Write-Debug "Version $CurrentRelease "


        $Parameters=@{
          Version=$Datas.LibraryChangesForVersion
          Type='Alias'
        }
        $T=@($Datas.RemovedAliasNames|Foreach-Object { New-SCCMCommandReleaseNote @Parameters -Name $_ -BreakingChange -Removed})
        $ReleaseNotes.AddRange($T)

        $Parameters.Type='Cmdlet'

        $T=@($Datas.RemovedCmdletNames|Foreach-Object { New-SCCMCommandReleaseNote @Parameters -Name $_ -BreakingChange -Removed})
        $ReleaseNotes.AddRange($T)

        $T=@($Datas.DeprecatedCommandNames|Foreach-Object { New-SCCMCommandReleaseNote @Parameters -Name $_ -Deprecated })
        $ReleaseNotes.AddRange($T)

        $T=@($Datas.UnResolvedBugCommandNames|Foreach-Object { New-SCCMCommandReleaseNote @Parameters -Name $_ -UnResolvedBug })
        $ReleaseNotes.AddRange($T)

        $T=@($Datas.ChangedCommandNames|Foreach-Object { New-SCCMCommandReleaseNote @Parameters -Name $_ -Changed })
        $ReleaseNotes.AddRange($T)

        $T=@($Datas.BreakingChangesCommandNames|Foreach-Object { New-SCCMCommandReleaseNote @Parameters -Name $_ -Changed -BreakingChange})
        $ReleaseNotes.AddRange($T)
   }
   Write-Output $ReleaseNotes -NoEnumerate
}


Function Find-CommandName{
#We search for the presence of a command name in source files.
#Occurrences in comments are considered, because if we use Powershell's AST
# you can no longer search in source files in C# for example.

  param(
      #List of filenames to scan.
    [string[]] $Path,

      #List of Release Notes version numbers to check. 
      #If the parameter is not specified, we search for all versions.
     [ValidateNotNull()]
    [string[]] $Version
  )

  $Groups=(Get-SCCMCommandReleaseNote -Version $Version)|
          Group-Object -Property Name -AsHashTable
  If ($null -eq $Groups)
  { 
    Write-Verbose "No release note found for version $Version" 
    return
  }
  ForEach ($CurrentFile in $Path)
  {
    ForEach ($CurrentCommand in $Groups.GetEnumerator())
    {
        $Pattern=$CurrentCommand.Name
        Write-Debug "Search '$Pattern' into '$CurrentFile'"

         #This is the first pass of source control
         #A code review is necessary as a second pass.
        if (Select-String -Path $CurrentFile -Pattern "\b${Pattern}\b" -Quiet)
        {
            #The command may be quoted for multiple reasons or appear in multiple release notes.
            Foreach ($CurrentDetail in $CurrentCommand.Value)
            {
                #We clone an object from the Groups list during iteration
              $o=$CurrentDetail.PSObject.Copy()
              $o.Path=$CurrentFile
              $o
              Write-Debug "found $O"
            }
        }
    }
  }
}
