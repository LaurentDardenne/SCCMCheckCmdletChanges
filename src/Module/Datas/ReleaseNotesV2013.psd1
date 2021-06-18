@{
   #Version de la release note
   LibraryChangesForVersion='2013'

   #Url de la release note
   Url='https://docs.microsoft.com/en-us/powershell/sccm/2103-release-notes?view=sccm-ps'

   #Les nouveaux cmdlets ne sont pas recensés car ils n'existent pas dans le code source.
   #Le contrôle des nouveaux cmdlets, en cas de modification, sera prise en charge par la prochaine release,

    #Cmdlet supprimés
    #Le code les utilisant est à corriger. Ces commandes sont considérés comme des breaking change
   RemovedCmdletNames=@(
   )

    #Alias supprimés
    #Le code les utilisant est à corriger. Ces commandes sont considérés comme des breaking change
   RemovedAliasNames=@(
   )

    #cmdlet obsolète (déconseillés)
    #Le code les utilisant n'est pas impacté, il est recommandé de ne plus les utiliser et d'adapter le code.
   DeprecatedCommandNames=@()

    #Les éléments suivants ont des problèmes connus de la bibliothèque d'applets de commande qui ne sont pas résolus dans cette version.
    #Le code les utilisant est peut-être à corriger si le bug n'était pas connu lors du développement.
   UnresolvedBugCommandNames=@(
   )

    #Les modifications suivantes ont été apportées aux applets de commande existantes dans cette version.
    #Elles peuvent être de nouvelles fonctionnalités, des correctifs de bogues ou la dépréciation.
    #Examinez attentivement les modifications pour comprendre comment elles peuvent affecter votre utilisation.
    #Le code les utilisant est peut-être à corriger si le bug n'était pas connu lors du développement.
   ChangedCommandNames=@(
      'Add-CMFallbackStatusPoint'
      'Copy-CMCollection'
      'Get-CMDeploymentStatusDetails'
      'Get-CMDriver'
      'Get-CMPackage'
      'Get-CMSoftwareUpdateDeployment'
      'New-CMApplication'
      'New-CMCertificateProfileScep'
      'New-CMCollection'
      'New-CMOperatingSystemImage'
      'New-CMOperatingSystemInstaller'
      'New-CMTSRule'
      'New-CMTSStepConditionVariable'
      'New-CMSoftwareUpdateAutoDeploymentRule'
      'Set-CMCertificateProfileScep'
      'Set-CMClientPushInstallation'
      'Set-CMCollection'
      'Set-CMEmailProfile'
      'Set-CMFallbackStatusPoint'
      'Set-CMThirdPartyUpdateCatalog'
      'Set-CMThirdPartyUpdateCategory'
      'Set-CMTSStepApplyDataImage'
      'Set-CMTSStepApplyDriverPackage'
      'Set-CMTSStepApplyNetworkSetting'
      'Set-CMTSStepApplyOperatingSystem'
      'Set-CMTSStepApplyWindowsSetting'
      'Set-CMTSStepAutoApplyDriver'
      'Set-CMTSStepCaptureNetworkSettings'
      'Set-CMTSStepCaptureSystemImage'
      'Set-CMTSStepCaptureUserState'
      'Set-CMTSStepCaptureWindowsSettings'
      'Set-CMTSStepConnectNetworkFolder'
      'Set-CMTSStepConvertDisk'
      'Set-CMTSStepDisableBitLocker'
      'Set-CMTSStepDownloadPackageContent'
      'Set-CMTSStepEnableBitLocker'
      'Set-CMTSStepInstallApplication'
      'Set-CMTSStepInstallSoftware'
      'Set-CMTSStepInstallUpdate'
      'Set-CMTSStepJoinDomainWorkgroup'
      'Set-CMTSStepOfflineEnableBitLocker'
      'Set-CMTSStepPartitionDisk'
      'Set-CMTSStepPrepareConfigMgrClient'
      'Set-CMTSStepPrepareWindows'
      'Set-CMTSStepPrestartCheck'
      'Set-CMTSStepReboot'
      'Set-CMTSStepReleaseStateStore'
      'Set-CMTSStepRequestStateStore'
      'Set-CMTSStepRestoreUserState'
      'Set-CMTSStepRunCommandLine'
      'Set-CMTSStepRunPowerShellScript'
      'Set-CMTSStepRunTaskSequence'
      'Set-CMTSStepSetDynamicVariable'
      'Set-CMTSStepSetupWindowsAndConfigMgr'
      'Set-CMTSStepSetVariable'
      'Set-CMTSStepUpgradeOperatingSystem'
       # following cmdlets add fast parameter, include 'Get-CMDriver'
      'Get-CMAlert'
      'Get-CMAlertSubscription'
      'Get-CMBaseline'
      'Get-CMBaselineDeployment'
      'Get-CMBaselineDeploymentStatus'
      'Get-CMClientCertificatePfx'
      'Get-CMComplianceRule'
      'Get-CMComplianceSetting'
      'Get-CMConfigurationPlatform'
      'Get-CMConfigurationPolicyDeployment'
      'Get-CMDriverPackage'
      'Get-CMTaskSequence'
      'Get-CMTaskSequenceDeployment'
  )

    #Les modifications suivantes sont indiquées comme étant des breaking change.
    #Le comportement de la commande a été modifié
    #Le code les utilisant est à corriger.
   BreakingChangesCommandNames=@(
      'New-CMSoftwareUpdateAutoDeploymentRule'
      'Set-CMSoftwareUpdateAutoDeploymentRule'
   )
}
