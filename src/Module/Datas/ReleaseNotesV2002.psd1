@{
    #Release
    #Configuration Manager current branch version 1910 is the baseline for these changes
   LibraryChangesForVersion='2002'

   Url='https://docs.microsoft.com/en-us/powershell/sccm/2002-release-notes?view=sccm-ps'

   RemovedCmdletNames=@()

   RemovedAliasNames=@()

   DeprecatedCommandNames=@()


   UnresolvedBugCommandNames=@()

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
