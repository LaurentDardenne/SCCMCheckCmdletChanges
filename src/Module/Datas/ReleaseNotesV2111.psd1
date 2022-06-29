
@{
    #Version de la release note
    LibraryChangesForVersion='2111'

    Url='https://docs.microsoft.com/en-us/powershell/sccm/2111-release-notes?view=sccm-ps'

    RemovedCmdletNames=@(
                'Get-CMTSStepConvertDisk'
                'New-CMTSStepConvertDisk',
                'Remove-CMTSStepConvertDisk',
                'Set-CMTSStepConvertDisk'
    )

    RemovedAliasNames=@(
    )


    DeprecatedCommandNames=@(
                'Add-CMDeploymentTypeSupersedence',
                'Remove-CMDeploymentTypeSupersedence',
                'Set-CMDeploymentTypeSupersedence'
    )

    UnresolvedBugCommandNames=@(
    )

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
                'Set-CMTSStepPrestartCheck',
                  # Changes to multiple cmdlets : verb 'Export', verb 'Import', 'Set-CM*DeploymentType' and 'New-CMRequirementRule*'
                  #'Export', 'Import' :
                  #  To allow for consistent parameter use across these cmdlets, they all have aliases for the parameter to specify the import path: FilePath, FileName, ImportFilePath, Path
                  #'Set-CM*DeploymentType'
                  #  This change applies to all cmdlets with 'Set' verbs to configure application deployment types
                  #'New-CMRequirementRule*'
                  #  This change applies to all cmdlets with the name pattern 'New-CMRequirementRule*', where * is the type of rule
                'Import-CMDeviceCollection',
                'Import-CMUserCollection',
                'Import-CMAADClientApplication',
                'Import-CMAADServerApplication',
                'Import-CMAntimalwarePolicy',
                'Import-CMApplication',
                'Import-CMBaseline',
                'Import-CMCertificate',
                'Import-CMClientCertificatePfx',
                'Import-CMCollection',
                'Import-CMComputerInformation',
                'Import-CMConfigurationItem',
                'Import-CMDriver',
                'Import-CMDriverPackage',
                'Import-CMPackage',
                'Import-CMQuery',
                'Import-CMSecurityRole',
                'Import-CMSoftwareLicense',
                'Import-CMTaskSequence',
                'Import-CMUserDeviceAffinity',
                'Import-CMWirelessProfileConfigurationItem',

                'Export-CMDeviceCollection',
                'Export-CMUserCollection',
                'Export-CMAntimalwarePolicy',
                'Export-CMApplication',
                'Export-CMBaseline',
                'Export-CMCollection',
                'Export-CMConfigurationItem',
                'Export-CMDriverPackage',
                'Export-CMPackage',
                'Export-CMQuery',
                'Export-CMSecurityRole',
                'Export-CMTaskSequence',

                'Set-CMAppxDeploymentType',
                'Set-CMMsixDeploymentType',
                'Set-CMWindowsDeeplinkDeploymentType',
                'Set-CMWindowsMsixDeploymentType',
                'Set-CMWindowsPhone8DeeplinkDeploymentType',
                'Set-CMWindowsPhone8DeploymentType',
                'Set-CMWindowsPhone8StoreDeploymentType',
                'Set-CMXapDeploymentType',
                'Set-CMAppv5XDeploymentType',
                'Set-CMAppvDeploymentType',
                'Set-CMDeploymentType',
                'Set-CMMacDeploymentType',
                'Set-CMMobileMsiDeploymentType',
                'Set-CMMsiDeploymentType',
                'Set-CMScriptDeploymentType',
                'Set-CMTaskSequenceDeploymentType',
                'Set-CMWebApplicationDeploymentType',
                'Set-CMWindowsAppxDeploymentType',
                'Set-CMWindowsPhoneDeploymentType',
                'Set-CMWindowsPhoneStoreDeploymentType',
                'Set-CMWindowsStoreDeploymentType',

                'New-CMRequirementRuleActiveDirectorySiteValue',
                'New-CMRequirementRuleBooleanValue',
                'New-CMRequirementRuleCMSiteValue',
                'New-CMRequirementRuleCommonValue',
                'New-CMRequirementRuleDeviceOwnershipValue',
                'New-CMRequirementRuleExistential',
                'New-CMRequirementRuleExpression',
                'New-CMRequirementRuleFileAttributeValue',
                'New-CMRequirementRuleFilePermissionValue',
                'New-CMRequirementRuleFreeDiskSpaceValue',
                'New-CMRequirementRuleInputTypeValue',
                'New-CMRequirementRuleOperatingSystemLanguageValue',
                'New-CMRequirementRuleOperatingSystemValue',
                'New-CMRequirementRuleOUValue',
                'New-CMRequirementRuleRegistryKeyPermissionValue',
                'New-CMRequirementRuleScreenResolutionValue'

    )

    BreakingChangesCommandNames=@(
                'New-CMTSStepApplyWindowsSetting',
                'Set-CMSoftwareUpdatePointComponent',
                'Set-CMTSStepApplyWindowsSetting'
    )
}
