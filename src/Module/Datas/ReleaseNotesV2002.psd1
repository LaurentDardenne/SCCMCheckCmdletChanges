@{
    #Release
    #Configuration Manager current branch version 1910 is the baseline for these changes
   LibraryChangesForVersion='2002'

   Url='https://docs.microsoft.com/en-us/powershell/sccm/2002-release-notes?view=sccm-ps'

   RemovedCmdletNames=@()

    #Alias supprimés
   RemovedAliasNames=@()

    #cmdlet obsolète (déconseillés)
   DeprecatedCommandNames=@()

    #Les éléments suivants ont des problèmes connus de la bibliothèque d'applets de commande qui ne sont pas résolus dans cette version.
   UnresolvedBugCommandNames=@()

    #Les modifications suivantes ont été apportées aux applets de commande existantes dans cette version.
    #Les modifications peuvent être de nouvelles fonctionnalités, des correctifs de bogues ou la dépréciation.
    #Examinez attentivement les modifications pour comprendre comment elles peuvent affecter votre utilisation.
   ChangedCommandNames=@(
    'Add-CMDeviceCollectionQueryMembershipRule'
    'Add-CMMsiDeploymentType'
    'Add-CMUserCollectionQueryMembershipRule'
    'Import-CMSoftwareLicense'
    'New-CMApplicationDeployment'
    'New-CMSiteSystem'
    'New-CMTSRule'
    'Set-CMApplicationDeployment'
    'Set-CMMsiDeploymentType'
    'Set-CMSite'
    'Set-CMThirdPartyUpdateCatalog'
   )

   BreakingChangesCommandNames=@(
    'Add-CMScriptDeploymentTypes'
    'Set-CMScriptDeploymentType'
   )
}
