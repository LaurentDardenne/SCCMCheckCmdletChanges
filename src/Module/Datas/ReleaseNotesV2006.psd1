@{
    #Release
    #Configuration Manager current branch version 1910 is the baseline for these changes
   LibraryChangesForVersion='2006'

   Url='https://docs.microsoft.com/fr-fr/powershell/sccm/2006-release-notes?view=sccm-ps'

   RemovedCmdletNames=@(
   )

    #Alias supprimés
   RemovedAliasNames=@(
   )

    #cmdlet obsolète (déconseillés)
   DeprecatedCommandNames=@()

    #Les éléments suivants ont des problèmes connus de la bibliothèque d'applets de commande qui ne sont pas résolus dans cette version.
   UnresolvedBugCommandNames=@(
   )

    #Les modifications suivantes ont été apportées aux applets de commande existantes dans cette version.
    #Les modifications peuvent être de nouvelles fonctionnalités, des correctifs de bogues ou la dépréciation.
    #Examinez attentivement les modifications pour comprendre comment elles peuvent affecter votre utilisation.
   ChangedCommandNames=@(
    'Add-CMComplianceSettingRegistryKeyValue'
    'Get-CMBootImage'
    'Get-CMOperatingSystemImage'
    'Get-CMOperatingSystemInstaller'
    'New-CMApplicationDeployment'
    'New-CMComplianceRuleValue'
    'New-CMTSStepEnableBitLocker'
    'New-CMTSStepOfflineEnableBitLocker'
    'New-CMTSStepPartitionDisk'
    'New-CMTSStepPrestartCheck'
    'Remove-CMDeployment'
    'Remove-CMResource'
    'Remove-CMTaskSequenceGroup'
    'Remove-CMTaskSequenceStep'
    'Set-CMBootImage'
    'Set-CMClientSetting'
    'Set-CMClientSettingComputerRestart'
    'Set-CMCloudManagementGateway'
    'Set-CMMsiDeploymentType'
    'Set-CMOperatingSystemImage'
    'Set-CMOperatingSystemInstaller'
    'Set-CMScriptDeploymentType'
   'Set-CMSoftwareUpdateAutoDeploymentRule'
    'Set-CMTSStepEnableBitLocker'
    'Set-CMTSStepOfflineEnableBitLocker'
    'Set-CMTSStepPartitionDisk'
    'Set-CMTSStepPrestartCheck'
   )

   BreakingChangesCommandNames=@(
   )
}
