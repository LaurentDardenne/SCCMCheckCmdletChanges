#SCCMCheckCmdletChanges.psm1

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

Function Get-SCCMCommandReleaseNote{
   param(
     #[ValidateNotNull()]
     [AllowNull()]
     [string[]] $Version
   )

   $isFilteredByVersion=$PSBoundParameters.ContainsKey('Version') -and ($null -ne $Version) -and ($Version.Count -gt 0)

   $ReleaseNotes=[System.Collections.ArrayList]::New()
    #On lit tous les fichiers présent car on peut vouloir connaitre toutes les versions enregistrées
   Foreach ($DataFile in Get-ChildItem -path "$PSScriptRoot\Datas\ReleaseNotes*.psd1")
   {
     try{

        $Data=Import-PowerShellDataFile $DataFile -ErrorAction Stop

        Write-Debug "Read $DataFile"
       if ($isFilteredByVersion -and ($Data.LibraryChangesForVersion -NotIn $Version))
       { Continue }

        $Parameters=@{
          Version=$Data.LibraryChangesForVersion
          Type='Cmdlet'
        }
        $T=@($Data.RemovedAliasNames|Foreach-Object { New-SCCMCommandReleaseNote -Version $Data.LibraryChangesForVersion -Name $_  -Type 'Alias' -BreakingChange -Removed})
        $ReleaseNotes.AddRange($T)

        $T=@($Data.RemovedCmdletNames|Foreach-Object { New-SCCMCommandReleaseNote @Parameters -Name $_  -BreakingChange -Removed})
        $ReleaseNotes.AddRange($T)

        $T=@($Data.DeprecatedCommandNames|Foreach-Object { New-SCCMCommandReleaseNote @Parameters -Name $_ -Deprecated })
        $ReleaseNotes.AddRange($T)

        $T=@($Data.UnResolvedBugCommandNames|Foreach-Object { New-SCCMCommandReleaseNote @Parameters -Name $_ -UnResolvedBug })
        $ReleaseNotes.AddRange($T)

        $T=@($Data.ChangedCommandNames|Foreach-Object { New-SCCMCommandReleaseNote @Parameters -Name $_ -Changed })
        $ReleaseNotes.AddRange($T)

        $T=@($Data.BreakingChangesCommandNames|Foreach-Object { New-SCCMCommandReleaseNote @Parameters -Name $_ -Changed -BreakingChange})
        $ReleaseNotes.AddRange($T)
    }
    catch [System.InvalidOperationException] #From Import-PowerShellDataFile
    { Write-Error $_  }
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
    [string[]] $Version
  )

  $Groups=(Get-SCCMCommandReleaseNote -Version $Version)|
          Group-Object -Property Name -AsHashTable

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
