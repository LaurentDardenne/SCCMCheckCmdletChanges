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
#Définie un objet de release SCCM
#Chaque commande présente dans une release note peut y être citée pour différentes raisons.
#On doit préciser au moins un cas de modification
#
#L'objet renvoyé ne porte qu'une information succincte, seul le texte de la 'release note' contient
# toutes les explications afférentes.
    param(
          [Parameter(Mandatory=$True,position=0)]
          #Configuration Manager Current Branch version
          #On duplique le numéro de version en cas mise à jour cumulative
        $Version,

          [Parameter(Mandatory=$True,position=1)]
          #Nom de la commande
        [string] $Name,

          [Parameter(position=2)]
          [ValidateSet('Cmdlet','Alias')]
        $Type,

          [Parameter(position=3)]
        $Path,

          #Si $True indique que la commande a été supprimée.
        [switch] $Removed,

          #Si $True indique que la commande est obsolète (l'usage est déconseillé).
        [switch] $Deprecated,

          #Si $True indique que la commande contient un bug qui n'a pas été résolu.
        [switch] $UnResolvedBug,

          #Si $True indique que la commande a été modifiée.
        [switch] $Changed,

          #Si $True indique que la commande apporte un breaking change (plusieurs raisons possible, modification/suppression).
        [switch] $BreakingChange
    )

    # On doit préciser au moins un cas
    $NoneOfTheCases=$null -eq ($Changed,$UnResolvedBug,$Removed,$Deprecated,$BreakingChange|Where-Object {$_.isPresent}|Select-Object -First 1)
    if ($NoneOfTheCases)
    { Throw "Vous devez préciser au moins un type de modification pour le nom de commande '$Name'." }

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

Function Test-ReleaseNoteRequirement{
  param(
    $Datas,
    $FileName)
try {
  $oldOFS,$ofs=$OFS,','

  $KeysToCompare=[string[]]$Datas.Keys
  $Groups=Compare-Object $script:KeysNameMustExist $KeysToCompare -IncludeEqual|Group-Object 'SideIndicator' -AsHashTable

    #Pas de différence
  if ($Groups.'=='.Count -ne $KeysNameMustExist.Count)
  {
      #Une ou + clés requises n'existent pas
      #absent de la liste 
    if ($Groups.'=>'.Count -gt 0)
    { Throw "The required keys do not exist : {0} . Release note file '{1}'" -F $Groups.'=>',$FileName }
      #Les clés requises existent, 
      #la collection comparée contient une ou des clés supplémentaires
    if ($Groups.'<='.Count -gt 0)
    { Write-Warning "The following are not managed : {0} . Release note file '{1}'" -F $Groups.'<=',$FileName }
  }
  #Teste les prerequis
  $RnVersion=$Datas.LibraryChangesForVersion
  [ref]$v=$null
  if ([String]::IsNullOrEmpty($RnVersion) -or ([int]::TryParse($RnVersion,$v) -eq $false))
  { Throw "The key 'LibraryChangesForVersion' must contains an integer : {0} . Release note file '{1}'" -F $RnVersion,$FileName }

  $Uri=[Uri]$Datas.Url
  if ( ($Uri.Scheme -notmatch 'Http') -or ($Uri.IsAbsoluteUri -ne $true) )
  { Throw "The key 'Url' must contains an URL. Release note file '{1}'" -F $Datas.Url,$FileName }

  Foreach ($Current in $script:KeysNameArrayType)
  {
    if ( ($null -eq $Datas.$Current) -or ($Datas.$Current -isnot [System.Array]) ) 
    { Throw "The key '$Current' must be of type Array. Release note file '{1}'" -F $Current,$FileName } 
  }

 } finally {
  $OFS=$oldOFS
 }
}

Function Get-SCCMCommandReleaseNote{
   param(
     #[ValidateNotNull()]
     [AllowNull()]
     [string[]] $Version
   )

   $isFilteredByVersion=$PSBoundParameters.ContainsKey('Version') -and ($null -ne $Version) -and ($Version.Count -gt 0)

   $ReleaseNotes=[System.Collections.ArrayList]::New()
    #On lit tous les fichiers présent car on peut vouloir connaitre toutes les versions enregistrées
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

        if ( $isFilteredByVersion -and ($Datas.LibraryChangesForVersion -NotIn $Version) )
        { Continue }
        Test-ReleaseNoteRequirement -Datas $Datas -FileName $Datafile -Exclude:$Filter

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
#On recherche la présence d'un nom de commande dans des fichiers sources.
#Les occurrences dans les commentaires sont considérées, car si on utilise l'AST de Powershell
# on ne peut plus rechercher dans les fichiers sources en C# par exemple.

  param(
      # Liste des noms de fichier.
    [string[]] $Path,

     # Liste de numéros de version des Releases Notes à vérifier
     [ValidateNotNull()]
    [string[]] $Version #todo vérifier les numéros de version, on recherche dans des release destinée à la production pas dans des prerelease
  )

  $Groups=(Get-SCCMCommandReleaseNote -Version $Version)|
          Group-Object -Property Name -AsHashTable
  #todo versions not exist
  ForEach ($CurrentFile in $Path)
  {
    ForEach ($CurrentCommand in $Groups.GetEnumerator())
    {
        $Pattern=$CurrentCommand.Name
        Write-Debug "Search '$Pattern' into '$CurrentFile'"

        #C'est la première passe du contrôle des sources
        #Une revue de code est nécessaire en seconde passe.
        if (Select-String -Path $CurrentFile -Pattern "\b${Pattern}\b" -Quiet)
        {
            #La commande peut être citée pour plusieurs raisons ou citée par plusieurs releasenotes.
            Foreach ($CurrentDetail in $CurrentCommand.Value)
            {
                #On clone un objet de la liste Groups en cours d'itération
              $o=$CurrentDetail.PSObject.Copy()
              $o.Path=$CurrentFile
              $o
              Write-Debug "found $O"
            }
        }
    }
  }
}
