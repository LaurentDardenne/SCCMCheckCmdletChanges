@{
   LibraryChangesForVersion='2010'

   Url='https://docs.microsoft.com/fr-fr/powershell/sccm/2010-release-notes?view=sccm-ps'

   RemovedCmdletNames=@(
      'Add-CMAndroidDeploymentType'
      'Add-CMGooglePlayDeploymentType'
      'Add-CMIosAppStoreDeploymentType'
      'Add-CMIosDeploymentType'
      'Set-CMAndroidDeploymentType'
      'Set-CMGooglePlayDeploymentType'
      'Set-CMIosAppStoreDeploymentType'
      'Set-CMIosDeploymentType'
   )

   RemovedAliasNames=@(
   )

   UnsupportedPSCoreCommandNames=@()
   
   DeprecatedCommandNames=@(
      'Set-CMClientSetting'
   )

   UnresolvedBugCommandNames=@(
   )

   ChangedCommandNames=@(
      'Add-CMComplianceSettingRegistryKeyValue'
      'Add-CMDistributionPoint'
      'Add-CMDeviceCollectionDirectMembershipRule'
      'Add-CMManagementPoint'
      'Add-CMWindowsAppxDeploymentType'
      'Approve-CMDevice'
      'Get-CMScript'
      'Get-CMSoftwareUpdate'
      'Get-CMStatusMessageQuery'
      'Import-CMDriver'
      'Invoke-CMAnalyzePackage'
      'Invoke-CMClientAction'
      'Invoke-CMConvertPackage'
      'Invoke-CMReport'
      'Invoke-CMScript'
      'New-CMBootableMedia'
      'New-CMCloudManagementGateway'
      'New-CMComplianceRuleFileFolderDate'
      'New-CMComplianceRuleFileFolderSimple'
      'New-CMDetectionClauseMacBundle'
      'New-CMDriverPackage'
      'New-CMApplicationAutoPhasedDeployment'
      'New-CMSoftwareUpdateAutoPhasedDeployment'
      'New-CMSoftwareUpdateManualPhasedDeployment'
      'New-CMTaskSequenceAutoPhasedDeployment'
      'New-CMTaskSequenceManualPhasedDeployment'
      'New-CMPrestageMedia'
      'New-CMProgram'
      'New-CMSoftwareUpdateDeployment'
      'New-CMStandaloneMedia'
      'New-CMTaskSequenceDeployment'
      'New-CMTSPartitionSetting'
      'Set-CMApplicationPhasedDeployment'
      'Set-CMSoftwareUpdatePhasedDeployment'
      'Set-CMTaskSequencePhasedDeployment'
      'Set-CMClientSettingSoftwareUpdate'
      'Set-CMCloudManagementGateway'
      'Set-CMDiscoveryMethod'
      'Set-CMDistributionPoint'
      'Set-CMDriverPackage'
      'Set-CMManagementPoint'
      'Set-CMProgram'
      'Set-CMSiteMaintenanceTask'
      'Set-CMSoftwareUpdateAutoDeploymentRule'
      'Set-CMSoftwareUpdateDeploymentPackage'
      'Set-CMSoftwareUpdateGroup'
      'Set-CMStatusFilterRule'
      'Set-CMTaskSequenceDeployment'
      'Set-CMWindowsAppxDeploymentType'
      'Start-CMContentDistribution'
   )

   BreakingChangesCommandNames=@(
      'Invoke-CMAnalyzePackage'
      'Invoke-CMConvertPackage'
      'New-CMCloudManagementGateway'
      'New-CMComplianceRuleFileFolderSimple'
      'New-CMProgram'
      'Set-CMProgram'
   )
}