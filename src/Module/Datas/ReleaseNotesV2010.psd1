@{
   LibraryChangesForVersion='2010'

   Url='https://docs.microsoft.com/fr-fr/powershell/sccm/2010-release-notes?view=sccm-ps'

   #Les nouveaux cmdlets ne sont pas recensés car ils n'existent pas dans le code source.
   #Le contrôle des nouveaux cmdlets, en cas de modification, sera prise en charge par la prochaine release,

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

    #Alias supprimés
   RemovedAliasNames=@(
   )

    #cmdlet obsolète (déconseillés)
   DeprecatedCommandNames=@(
      'Set-CMClientSetting'
   )

    #Les éléments suivants ont des problèmes connus de la bibliothèque d'applets de commande qui ne sont pas résolus dans cette version.
   UnresolvedBugCommandNames=@(
   )

    #Les modifications suivantes ont été apportées aux applets de commande existantes dans cette version.
    #Les modifications peuvent être de nouvelles fonctionnalités, des correctifs de bogues ou la dépréciation.
    #Examinez attentivement les modifications pour comprendre comment elles peuvent affecter votre utilisation.
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