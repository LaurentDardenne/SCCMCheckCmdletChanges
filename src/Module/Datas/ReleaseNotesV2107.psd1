@{

    LibraryChangesForVersion='2107'

    Url='https://docs.microsoft.com/en-us/powershell/sccm/2107-release-notes?view=sccm-ps'

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

    RemovedAliasNames=@(
    )

    DeprecatedCommandNames=@(
        'Start-CMApplicationDeploymentSimulation',
        'Start-CMClientSettingDeployment',
        'Start-CMAntimalwarePolicyDeployment'
    )

    UnresolvedBugCommandNames=@(
    )

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

    BreakingChangesCommandNames=@(
        'Add-CMDistributionPoint',
        'New-CMCloudManagementGateway',
        'New-CMSecondarySite',
        'Start-CMDistributionPointUpgrade'
    )
}
