@{
    #Release
    #Configuration Manager current branch version 1702 is the baseline for these changes.
   LibraryChangesForVersion='1706'

   Url='https://github.com/MicrosoftDocs/sccm-docs-powershell-ref/blob/main/docs-conceptual/1706_Release_Notes.md'

   RemovedCmdletNames=@(
    'Add-CMComplianceRegistrySetting',
    'New-CMComplianceRule'
   )

   RemovedAliasNames=@(
   )

   DeprecatedCommandNames=@(
   )

   UnresolvedBugCommandNames=@(
    'Get-CMAadConditionalAccessPolicy',
    'Set-CMAadConditionalAccessPolicy',
    'New-CMWirelessProfile',
    'Set-CMWirelessProfile',
    'Add-CMDataWarehouseServicePoint',
    'Set-CMDataWarehouseServicePoint',
    'Import-CMSecurityRole',
    'New-CMApplicationDeployment',
    'New-CMClientSettingDeployment',
    'Remove-CMStateMigrationPoint'   
   )
   
   ChangedCommandNames=@(
    'Add-CMApplicationCatalogWebsitePoint',
    'Add-CMAssetIntelligenceSynchronizationPoint',
    'Add-CMMacDeploymentType',
    'Add-CMMsiDeploymentType',
    'Add-CMScriptDeploymentType',
    'Add-CMWindowsPhoneStoreDeploymentType',
    'Approve-CMApprovalRequest',
    'Deny-CMApprovalRequest',
    'Get-CMAlert',
    'Get-CMApprovalRequest',
    'Get-CMMaintenanceWindow',
    'Import-CMWirelessProfileConfigurationItem',
    'Import-CMClientCertificatePfx',
    'Import-CMDriver',
    'Import-CMTaskSequence',
    'Lock-CMObject',
    'New-CMADGroupDiscoveryScope',
    'New-CMAlertSubscription',
    'New-CMApplicationDeployment',
    'New-CMCertificateProfileScep',
    'New-CMTaskSequence',
    'New-CMSoftwareUpdateAutoDeploymentRule',
    'Remove-CMAssetIntelligenceSynchronizationPoint',
    'Remove-CMMaintenanceWindow',
    'Remove-CMUpdateGroupDeployment',
    'Set-CMAlertSubscription #Deprecations',
    'Set-CMApplicationDeployment',
    'Set-CMConfigurationPolicyDeployment',
    'Set-CMEmailNotificationComponent',
    'Set-CMHierarchySetting',
    'Set-CMMacDeploymentType',
    'Set-CMMsiDeploymentType',
    'Set-CMProgram',
    'Set-CMScriptDeploymentType',
    'Set-CMSiteMaintenanceTask',
    'Set-CMSoftwareUpdateAutoDeploymentRule',
    'Set-CMSoftwareUpdatePointComponent',
    'Set-CMWindowsPhoneStoreDeploymentType' 
   )

   BreakingChangesCommandNames=@(   
    'Add-CMDataWarehouseServicePoint',
    'Set-CMDataWarehouseServicePoint',  
    'Set-CMSoftwareInventory'
   )    
}
