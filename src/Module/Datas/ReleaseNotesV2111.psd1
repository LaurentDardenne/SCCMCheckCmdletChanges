#Ce Template de release note SCCM est utilisé par le module afin de contrôler les clés obligatoires
#Toutes les clés le sont, si une des clés n'est pas utilisée elle doit être associées à un tableau vide.

@{
    #Version de la release note
    LibraryChangesForVersion='2111'

    #Url de la release note
    Url='https://docs.microsoft.com/en-us/powershell/sccm/2111-release-notes?view=sccm-ps'

    #Les nouveaux cmdlets ne sont pas recensés car ils n'existent pas dans le code source.
    #Le contrôle des nouveaux cmdlets, en cas de modification, sera prise en charge par la prochaine release,

     #Cmdlet supprimés
     #Le code les utilisant est à corriger. Ces commandes sont considérés comme des breaking change
    RemovedCmdletNames=@(
	'Get-CMTSStepConvertDisk'
	'New-CMTSStepConvertDisk',
	'Remove-CMTSStepConvertDisk',
	'Set-CMTSStepConvertDisk'
    )

     #Alias supprimés
     #Le code les utilisant est à corriger. Ces commandes sont considérés comme des breaking change
    RemovedAliasNames=@(
    )

     #cmdlet obsolète (déconseillés)
     #Le code les utilisant n'est pas impacté, il est recommandé de ne plus les utiliser et d'adapter le code.
    DeprecatedCommandNames=@(
	'Add-CMDeploymentTypeSupersedence',
	'Remove-CMDeploymentTypeSupersedence',
	'Set-CMDeploymentTypeSupersedence',
    )

     #Les éléments suivants ont des problèmes connus de la bibliothèque d'applets de commande qui ne sont pas résolus dans cette version.
     #Le code les utilisant est peut-être à corriger si le bug n'était pas connu lors du développement.
    UnresolvedBugCommandNames=@(
    )

     #Les modifications suivantes ont été apportées aux applets de commande existantes dans cette version.
     #Elles peuvent être de nouvelles fonctionnalités, des correctifs de bogues ou la dépréciation.
     #Examinez attentivement les modifications pour comprendre comment elles peuvent affecter votre utilisation.
     #Le code les utilisant est peut-être à corriger si le bug n'était pas connu lors du développement.
    ChangedCommandNames=@(
	'Add-CMDeviceCollectionDirectMembershipRule',
	'Add-CMDistributionPoint',
	'Get-CMClientSetting',
	'Get-CMPersistentUserSettingsGroup',
	'Get-CMUserDeviceAffinity',
	'New-CMBoundary',
	'New-CMTSPartitionSetting',
	'New-CMTSStepPrestartCheck',
	'New-CMWdacSetting',
	'Remove-CMPersistentUserSettingsGroup',
	'Set-CMBoundary',
	'Set-CMDeviceVariable',
	'Set-CMDistributionPoint',
	'Set-CMSoftwareUpdatePoint',
	'Set-CMTSStepPrestartCheck'
    )

     #Les modifications suivantes sont indiquées comme étant des breaking change.
     #Le comportement de la commande a été modifié
     #Le code les utilisant est à corriger.
    BreakingChangesCommandNames=@(
	'New-CMTSStepApplyWindowsSetting',
	'Set-CMSoftwareUpdatePointComponent',
	'Set-CMTSStepApplyWindowsSetting'
    )
}
