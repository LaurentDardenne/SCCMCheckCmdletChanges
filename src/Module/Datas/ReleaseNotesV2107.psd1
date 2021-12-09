#Ce Template de release note SCCM est utilisé par le module afin de contrôler les clés obligatoires
#Toutes les clés le sont, si une des clés n'est pas utilisée elle doit être associées à un tableau vide.

@{
    #Version de la release note
    LibraryChangesForVersion='2107'

    #Url de la release note
    Url='https://docs.microsoft.com/en-us/powershell/sccm/2107-release-notes?view=sccm-ps'

    #Les nouveaux cmdlets ne sont pas recensés car ils n'existent pas dans le code source.
    #Le contrôle des nouveaux cmdlets, en cas de modification, sera prise en charge par la prochaine release,

     #Cmdlet supprimés
     #Le code les utilisant est à corriger. Ces commandes sont considérés comme des breaking change
    RemovedCmdletNames=@(
        'Add-CMApplicationCatalogWebServicePoint',
        'Add-CMApplicationCatalogWebsitePoint',
        'Get-CMApplicationCatalogWebServicePoint',
        'Get-CMApplicationCatalogWebsitePoint',
        'Remove-CMApplicationCatalogWebServicePoint',
        'Remove-CMApplicationCatalogWebsitePoint',
        'Set-CMApplicationCatalogWebsitePoint',
        'Get-CMVhd',
        'New-CMVhd',
        'Remove-CMVhd',
        'Set-CMVhd'
    )

     #Alias supprimés
     #Le code les utilisant est à corriger. Ces commandes sont considérés comme des breaking change
    RemovedAliasNames=@(
    )

     #cmdlet obsolète (déconseillés)
     #Le code les utilisant n'est pas impacté, il est recommandé de ne plus les utiliser et d'adapter le code.
    DeprecatedCommandNames=@(
        'Start-CMApplicationDeploymentSimulation',
        'Start-CMClientSettingDeployment',
        'Start-CMAntimalwarePolicyDeployment'
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
        'Add-CMTaskSequenceStep',
        'Disconnect-CMTrackedObject',
        'Get-CMApplicationGroup',
        'Get-CMDeploymentStatusDetails',
        'Import-CMAntimalwarePolicy',
        'Import-CMQuery',
        'New-CMAdministrativeUser',
        'New-CMApplicationDeployment',
        'New-CMMigrationJob',
        'New-CMSoftwareUpdateAutoDeploymentRule',
        'New-CMSoftwareUpdateDeployment',
        'New-CMTaskSequence',
        'New-CMTaskSequenceDeployment',
        'New-CMTSStepApplyDriverPackage',
        'New-CMTSStepApplyOperatingSystem',
        'New-CMTSStepUpgradeOperatingSystem',
        'Publish-CMPrestageContent',
        'Remove-CMApplicationGroup',
        'Set-CMAntimalwarePolicy',
        'Set-CMApplicationDeployment',
        'Set-CMClientSetting',
        'Set-CMClientSettingSoftwareUpdate',
        'Set-CMDeploymentType',
        'Set-CMMsiDeploymentType',
        'Set-CMTaskSequence',
        'Set-CMTSStepApplyDriverPackage',
        'Set-CMTSStepApplyOperatingSystem',
        'Set-CMTSStepUpgradeOperatingSystem',
        'Update-CMDistributionPoint'
    )

     #Les modifications suivantes sont indiquées comme étant des breaking change.
     #Le comportement de la commande a été modifié
     #Le code les utilisant est à corriger.
    BreakingChangesCommandNames=@(
        'Add-CMDistributionPoint',
        'New-CMCloudManagementGateway',
        'New-CMSecondarySite',
        'Start-CMDistributionPointUpgrade'
    )
}
