@{
    #Release
    #Configuration Manager current branch version 1802 is the baseline for these changes.
   LibraryChangesForVersion='1806'

   Url='https://github.com/MicrosoftDocs/sccm-docs-powershell-ref/blob/main/docs-conceptual/1806_Release_Notes.md'

   RemovedCmdletNames=@(
   )

   RemovedAliasNames=@(
   )

   DeprecatedCommandNames=@(
    'New-CMGlobalCondition',
    'Set-CMGlobalCondition'
   )

   UnresolvedBugCommandNames=@(
    'Get-CMDevice',
    'Get-CMAadConditionalAccessPolicy',
    'Set-CMAadConditionalAccessPolicy'
    'Import-CMSecurityRole',
    'Set-CMSoftwareUpdatePoint'
   )

   ChangedCommandNames=@(
    'Add-CMApplication',
    'Add-CMDataWarehouseServicePoint',
    'Add-CMDeviceCollectionDirectMembershipRule',
    'Add-CMDeviceAffinityToUser',
    'Add-CMDistributionPoint',
    'Add-CMDriverToDriverPackage',
    'Add-CMReportingServicePoint',
    'Add-CMUserAffinityToDevice',
    'Get-CMSiteUpdateInstallStatus',
    'New-CMApplicationDeployment',
    'New-CMBootableMedia',
    'New-CMCloudDistributionPoint',
    'New-CMCloudManagementGateway',
    'New-CMExchangeServer',
    'New-CMTaskSequenceDeployment',
    'Remove-CMDeviceAffinityToUser',
    'Remove-CMDeviceCollectionDirectMembershipRule',
    'Remove-CMDriverFromDriverPackage',
    'Remove-CMUserAffinityToDevice',
    'Save-CMSoftwareUpdate',
    'Set-CMApplication',
    'Set-CMApplicationDeployment',
    'Set-CMDataWarehouseServicePoint',
    'Set-CMDistributionPoint',
    'Set-CMExchangeServer',
    'Set-CMIntuneSubscriptionWindowsProperty',
    'Set-CMSite',
    'Set-CMSoftwareUpdatePointComponent',
    'Start-CMApplicationDeployment',
    'Start-CMDistributionPointUpgrade'
   )

   BreakingChangesCommandNames=@(
    'New-CMTSStepPrestartCheck',
    'Get-CMTSStep*' #todo liste ?
   )
}
