@{
    #Release
    #Configuration Manager current branch version 1902 is the baseline for these changes
   LibraryChangesForVersion='1906'

   Url='https://github.com/MicrosoftDocs/sccm-docs-powershell-ref/blob/main/docs-conceptual/1906-release-notes.md'

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
    'Import-CMSecurityRole',
    'Set-CMSoftwareUpdatePoint'
   )

   ChangedCommandNames=@(
    'Add-CMComplianceSettingScript',
    'Add-CMDeviceCollectionDirectMembershipRule',
    'Add-CMMsiDeploymentType',
    'Add-CMScriptDeploymentType',
    'Add-CMUserCollectionDirectMembershipRule',
    'Import-CMDriver',
    'Import-CMDriverPackage',
    'Import-CMTaskSequence',
    'Invoke-CMClientAction',
    'Invoke-CMEndpointProtectionScan',
    'Invoke-CMQuery',
    'Get-CMApplicationDeployment',
    'New-CMApplication',
    'New-CMApplicationDeployment',
    'New-CMApplicationDisplayInfo',
    'New-CMAutoDeploymentRuleDeployment',
    'New-CMBaseline',
    'New-CMBootableMedia',
    'New-CMCaptureMedia',
    'New-CMPackage',
    'New-CMPackageDeployment',
    'New-CMPrestageMedia',
    'New-CMRequirementRuleCommonValue',
    'New-CMSchedule',
    'New-CMSoftwareUpdateAutoDeploymentRule',
    'New-CMSoftwareUpdateDeployment',
    'New-CMStandaloneMedia',
    'New-CMStatusFilterRule',
    'New-CMTSStepApplyNetworkSetting',
    'New-CMTSStepApplyWindowsSettings',
    'New-CMTSStepCaptureSystemImage',
    'New-CMTSStepConnectNetworkFolder',
    'New-CMTSStepDisableBitLocker',
    'New-CMTSStepEnableBitLocker',
    'New-CMTSStepInstallApplication',
    'New-CMTSStepJoinDomainWorkgroup',
    'New-CMTSStepRestoreUserState',
    'New-CMTSStepRunCommandLine',
    'New-CMTSStepRunPowerShellScript',
    'New-CMWindowsFirewallPolicy',
    'Remove-CMSoftwareUpdatePoint',
    'Set-CMApplication',
    'Set-CMAutoDeploymentRuleDeployment',
    'Set-CMBaseline',
    'Set-CMClientSettingPowerManagement',
    'Set-CMClientSettingSoftwareCenter',
    'Set-CMComplianceRuleValue',
    'Set-CMDistributionPoint',
    'Set-CMMsiDeploymentType',
    'Set-CMPackage',
    'Set-CMScriptDeploymentType',
    'Set-CMSoftwareUpdateAutoDeploymentRule',
    'Set-CMSoftwareUpdateDeployment',
    'Set-CMStatusFilterRule',
    'Set-CMTaskSequenceDeployment',
    'Set-CMTSStepApplyNetworkSetting',
    'Set-CMTSStepApplyWindowsSettings',
    'Set-CMTSStepCaptureSystemImage',
    'Set-CMTSStepConnectNetworkFolder',
    'Set-CMTSStepDisableBitLocker',
    'Set-CMTSStepEnableBitLocker',
    'Set-CMTSStepInstallApplication',
    'Set-CMTSStepJoinDomainWorkgroup',
    'Set-CMTSStepRestoreUserState',
    'Set-CMTSStepRunCommandLine',
    'Set-CMTSStepRunPowerShellScript',
    'Set-CMWindowsFirewallPolicy',
    'Start-CMPackageDeployment'
  )

   BreakingChangesCommandNames=@()
}
