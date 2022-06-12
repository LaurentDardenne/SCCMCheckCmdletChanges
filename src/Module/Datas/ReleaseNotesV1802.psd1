@{
    #Release
    #Configuration Manager current branch version 1802 is the baseline for these changes.
   LibraryChangesForVersion='1802'

   Url='https://github.com/MicrosoftDocs/sccm-docs-powershell-ref/blob/main/docs-conceptual/1802_Release_Notes.md'

   RemovedCmdletNames=@(
   )

   RemovedAliasNames=@(
   )

   DeprecatedCommandNames=@(
    'Set-CMApplication', #only some parameters
    'Set-CMClientSettingClientcache' #only some parameters
   )

   UnresolvedBugCommandNames=@(
    'New-CMCloudDistributionPoint',
    'Get-CMAadConditionalAccessPolicy',
    'Set-CMAadConditionalAccessPolicy',
    'Import-CMSecurityRole',
    'Set-CMSoftwareUpdatePoint'
   )

   ChangedCommandNames=@(
    'New-CMTSRule',
    'New-CMTSStepApplyOperatingSystem',
    'Set-CMTSStepApplyOperatingSystem',
    'New-CMTSStepApplyWindowsSetting',
    'Set-CMTSStepApplyWindowsSetting'
    'New-CMTSStepInstallSoftware',
    'Set-CMTSStepInstallSoftware',
    'Add-CMComplianceSettingRegistryKeyValue',
    'Add-CMManagementPoint',
    'Add-CMMsiDeploymentType',
    'Add-CMScriptDeploymentType',
    'Add-CMSoftwareUpdatePoint',
    'Enable-CMSiteFeature',
    'Get-CMSiteInstallStatus',
    'Get-CMSiteStatusMessage',
    'New-CMBootableMedia',
    'New-CMComplianceRuleFileFolderSize',
    'New-CMDetectionClauseMacPackage',
    'New-CMDetectionClauseWindowsInstaller'
    'New-CMExchangeServer',
    'New-CMInventoryReportClass*', #todo list
    'New-CMPrestagedMedia',
    'New-CMProgram',
    'New-CMSchedule',
    'New-CMStandaloneMedia',
    'New-CMStatusFilterRule',
    'New-CMStorageFolder',
    'New-CMTaskSequenceDeployment',
    'New-CMWirelessProfile',
    'Publish-CMPrestageContent',
    'Set-CMAntimalwarePolicy',
    'Set-CMApplication',
    'Set-CMBoundary',
    'Set-CMManagementPoint',
    'Set-CMMsiDeploymentType'
    'Set-CMPackage',
    'Set-CMSoftwareInventory',
    'Set-CMStatusFilterRule',
    'Set-CMUserDataAndProfileConfigurationItem',
    'Set-CMWirelessProfile'
  )

   BreakingChangesCommandNames=@(
    'Get-CMApplication'
   )
}
