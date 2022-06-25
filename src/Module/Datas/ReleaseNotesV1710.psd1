@{
    #Release
    #Configuration Manager current branch version 1706 is the baseline for these changes.
   LibraryChangesForVersion='1710'

   Url='https://github.com/MicrosoftDocs/sccm-docs-powershell-ref/blob/main/docs-conceptual/1710_Release_Notes.md'

   RemovedCmdletNames=@(
    'Invoke-CMAmtProvisioningDiscovery',
    'New-CMAmtProvisioningAccount',
    'Set-CMPowerControl'    
   )

   RemovedAliasNames=@(
   )

   DeprecatedCommandNames=@(
    'Invoke-CMEndpointProtectionScan',
    'Save-CMEndpointProtectionDefinition' #superseded by Invoke-CMClientAction.
   )

   UnresolvedBugCommandNames=@(
    'Get-CMAadConditionalAccessPolicy',
    'Set-CMAadConditionalAccessPolicy',
    'Import-CMSecurityRole',
    'Get-CMSiteUpdateInstallStatus',
    'Set-CMSoftwareUpdatePoint'    
   )
   
   #change : Disable PSDrive auto-creation
   ChangedCommandNames=@(
    'Add-CMComplianceSettingRegistryKeyValue',
    'Set-CMComplianceSettingRegistryKeyValue',
    'New-CMDetectionClauseRegistryKeyValue',
    'New-CMComplianceRuleAssembly',
    'Add-CMComplientSettingRegistryKeyValue',
    'Add-CMApplicationCatalogWebsitePoint',
    'Add-CMDataWarehouseServicePoint',
    'Set-CMDataWarehouseServicePoint',
    'Add-CMExchangeServer',
    'Set-CMExchangeServer',
    'Add-CMMsiDeploymentType',
    'Add-CMScriptDeploymentType',
    'Get-CMDeploymentTypeDependencyGroup',
    'Get-CMSiteStatusMessage',
    'Invoke-CMClientAction',
    'New-CM*Deployment',
    'New-CMBootableMedia',
    'New-CMWirelessProfile',
    'Remove-CMCorpOwnedDevice',
    'Save-CMSoftwareUpdate',
    'Set-CMAccessAccount',
    'Set-CMAntimalwarePolicy',
    'Set-CMClientSettingComputerAgent',
    'Set-CMClientSettingHardwareInventory',
    'Set-CMMsiDeploymentType',
    'Set-CMScriptDeployment',
    'Set-CMScriptDeploymentType',
    'Set-CMSoftwareUpdatePointComponent',
    'Set-CMSiteMaintenanceTask',
    'Set-CMWirelessProfile',
    'Sync-CMSoftwareUpdate'
    )

    BreakingChangesCommandNames=@(
     'Remove-CMStateMigrationPoint'
    )    
}
