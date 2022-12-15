@{
    #Release
    #Configuration Manager current branch version 1810 is the baseline for these changes.
   LibraryChangesForVersion='1902'

   Url='https://github.com/MicrosoftDocs/sccm-docs-powershell-ref/blob/main/docs-conceptual/1902-release-notes.md'

   RemovedCmdletNames=@(
   )

   RemovedAliasNames=@(
   )

   UnsupportedPSCoreCommandNames=@()
   
   DeprecatedCommandNames=@(
     'Get-CMAadConditionalAccessPolicy',
     'Set-CMAadConditionalAccessPolicy'
   )

   UnresolvedBugCommandNames=@(
    'Get-CMAadConditionalAccessPolicy',
    'Set-CMAadConditionalAccessPolicy'
    'Import-CMSecurityRole',
    'Set-CMSoftwareUpdatePoint'

   )

   ChangedCommandNames=@(
    'Add-CMDeviceAffinityToUser',
    'Add-CMDeviceCollectionDirectMembershipRule',
    'Add-CMDistributionPoint',
    'Add-CMScriptDeploymentType',
    'Approve-CMApprovalRequest',
    'Get-CMDevice',
    'Get-CMPackage',
    'Import-CMDriver',
    'Invoke-CMScript',
    'New-CMActiveDirectoryForest',
    'New-CMApplication',
    'New-CMApplicationDeployment',
    'New-CMCoManagementPolicy',
    'New-CMDetectionClauseWindowsInstaller',
    'New-CMOperatingSystemImageUpdateSchedule',
    'New-CMOperatingSystemUpgradeUpdateSchedule',
    'New-CMPackageDeployment',
    'New-CMStatusFilterRule',
    'New-CMTaskSequenceDeployment',
    'New-CMTaskSequenceMedia',
    'New-CMTSStepRunPowerShellScript',
    'Remove-CMDeviceAffinityFromUser',
    'Set-CMActiveDirectoryForest',
    'Set-CMApplicationDeployment',
    'Set-CMClientSetting',
    'Set-CMClientSettingComputerRestart',
    'Set-CMComplianceRuleExistential',
    'Set-CMDiscoveryMethod',
    'Set-CMDistributionPoint',
    'Set-CMDriver',
    'Set-CMStatusFilterRule',
    'Set-CMTSStepRunPowerShellScript',
    'Set-CMWindowsFirewallPolicy'
   )

   BreakingChangesCommandNames=@(
    'Set-CMManagementPoint'
   )
}
