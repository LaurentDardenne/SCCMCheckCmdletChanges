@{
    #Release
    #Configuration Manager current branch version 1806 is the baseline for these changes.
   LibraryChangesForVersion='1810'

   Url='https://github.com/MicrosoftDocs/sccm-docs-powershell-ref/blob/main/docs-conceptual/1810-release-notes.md'

   RemovedCmdletNames=@(
   )

   RemovedAliasNames=@(
   )

   DeprecatedCommandNames=@(
   )

   UnresolvedBugCommandNames=@(
    'Get-CMAadConditionalAccessPolicy',
    'Set-CMAadConditionalAccessPolicy'
    'Import-CMSecurityRole',
    'Set-CMSoftwareUpdatePoint'
   )

   ChangedCommandNames=@(
    'Add-CMDistributionPoint',
    'Add-CMIntuneSubscription',
    'Add-CMManagementPoint',
    'Clear-CMPxeDeployment',
    'Get-CMDevice',
    'Get-CMHierarchySetting',
    'New-CMAntimalwarePolicyDeployment',
    'New-CMComplianceRuleExistential',
    'New-CMConfigurationPolicyuDeployment',
    'New-CMUserDataAndProfileConfigurationItem',
    'New-CMWirelessProfile',
    'Set-CMComplianceRuleExistential',
    'Set-CMDistributionPoint',
    'Set-CMHierarchySetting',
    'Set-CMIntuneSubscription',
    'Set-CMManagementPoint',
    'Set-CMMsiDeploymentType',
    'Set-CMSoftwareUpdatePointComponent',
    'Set-CMTSStepJoinDomainWorkgroup',
    'Set-CMTSStepCaptureUserState',
    'Set-CMUserDataAndProfileConfigurationItem',
    'Set-CMWirelessProfile'
   )

   BreakingChangesCommandNames=@(
    'Set-CMManagementPoint'
   )
}
