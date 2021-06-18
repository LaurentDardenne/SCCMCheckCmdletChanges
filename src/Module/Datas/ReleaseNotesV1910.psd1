@{
    #Release
    #Configuration Manager current branch version 1906 is the baseline for these changes
   LibraryChangesForVersion='1910'

   Url='https://docs.microsoft.com/en-us/powershell/sccm/1910-release-notes?view=sccm-ps'

   RemovedCmdletNames=@(
    'Add-CMIntuneSubscription'
    'Add-CMMdmEnrollmentManager'
    'Add-CMIntuneDeviceEnrollmentManager'
    'Export-CMWindowsEnrollmentProfile'
    'Get-CMConditionalAccessPolicy'
    'CMOnPremConditionalAccessPolicy'
    'Get-CMCorpOwnedDevice'
    'Get-CMDeviceActionState'
    'CMDeviceAction'
    'Get-CMIntuneSubscription'
    'Get-CMIosEnrollmentProfile'
    'Get-CMMdmEnrollmentManager'
    'CMIntuneDeviceEnrollmentManager'
    'Get-CMWindowsEnrollmentProfile'
    'Get-CMWindowsEnrollmentProfilePackage'
    'Invoke-CMDeviceAction'
    'New-CMApnsCertificateRequest'
    'New-CMConditionalAccessPolicy'
    'New-CMOnPremConditionalAccessPolicy'
    'New-CMDepTokenRequest'
    'New-CMIosEnrollmentProfile'
    'New-CMWindowsEnrollmentProfile'
    'Remove-CMConditionalAccessPolicy'
    'Remove-CMOnPremConditionalAccessPolicy'
    'Remove-CMCorpOwnedDevice'
    'Remove-CMIntuneSubscription'
    'Remove-CMIosEnrollmentProfile'
    'Remove-CMMdmEnrollmentManager'
    'Remove-CMIntuneDeviceEnrollmentManager'
    'Remove-CMWindowsEnrollmentProfile'
    'Remove-CMWindowsEnrollmentProfilePackage'
    'Set-CMConditionalAccessPolicy'
    'Set-CMIntuneSubscription'
    'Set-CMIntuneSubscriptionAndroidProperty'
    'Set-CMIntuneSubscriptionAndroidProperties'
    'Set-CMIntuneSubscriptionAppleDepProperty'
    'Set-CMIntuneSubscriptionAppleProperty'
    'Set-CMIntuneSubscriptionPassportForWorkProperty'
    'Set-CMIntuneSubscriptionWindowsPhoneProperty'
    'Set-CMIntuneSubscriptionWindowsPhoneProperties'
    'Set-CMIntuneSubscriptionWindowsProperty'
    'Set-CMIntuneSubscriptionWindowsProperties'
    'Set-CMIosEnrollmentProfile'
    'Set-CMIosEnrollmentProfileAssignment'
    'Set-CMWindowsEnrollmentProfile'
   )

    #Alias supprimés
   RemovedAliasNames=@(
    'Set-CMIntuneSubscriptionMacOSProperties'
    'Set-CMIntuneSubscriptionIosProperties'
    'Set-CMIntuneSubscriptionMacOSProperty'
    'Set-CMIntuneSubscriptionIosProperty'
    'Set-CMIntuneSubscriptionAppleMdmProperty'
   )

    #cmdlet obsolète (déconseillés)
   DeprecatedCommandNames=@()

    #Les éléments suivants ont des problèmes connus de la bibliothèque d'applets de commande qui ne sont pas résolus dans cette version.
   UnresolvedBugCommandNames=@(
    'Import-CMSecurityRole'
    'Set-CMSoftwareUpdatePoint'
   )

    #Les modifications suivantes ont été apportées aux applets de commande existantes dans cette version.
    #Les modifications peuvent être de nouvelles fonctionnalités, des correctifs de bogues ou la dépréciation.
    #Examinez attentivement les modifications pour comprendre comment elles peuvent affecter votre utilisation.
   ChangedCommandNames=@(
    'Add-CMDistributionPoint'
    'Add-CMMsiDeploymentType'
    'Import-CMDriver'
    'New-CMApplicationDeployment'
    'New-CMDriverPackage'
    'New-CMSoftwareUpdateAutoDeploymentRule'
    'New-CMTaskSequence'
    'New-CMTSStepApplyWindowsSetting'
    'New-CMTSStepDownloadPackageContent'
    'New-CMTSStepRunCommandLine'
    'Get-CMDevice'
    'Get-CMScript'
    'Remove-CMApplicationDeployment'
    'Remove-CMDevice'
    'Set-CMBootImage'
    'Set-CMClientSettingClientPolicy'
    'Set-CMClientSettingSoftwareUpdate'
    'Set-CMDistributionPoint'
    'Set-CMDriverPackage'
    'Set-CMMsiDeploymentType'
    'Set-CMScript'
    'Set-CMSite'
    'Set-CMSiteSystemServer'
    'Set-CMSoftwareUpdateAutoDeploymentRule'
    'Set-CMSoftwareUpdateDeployment'
    'Set-CMSoftwareUpdateDeploymentPackage'
    'Set-CMSoftwareUpdatePointComponent'
    'Set-CMTaskSequence'
    'Set-CMTSStepApplyWindowsSetting'
    'Set-CMTSStepDownloadPackageContent'
    'Set-CMTSStepRunCommandLine'
   )

   BreakingChangesCommandNames=@()
}
