
@{
    LibraryChangesForVersion='0001'
 
    Url='https://docs.microsoft.com/en-us/powershell/sccm/2207-release-notes?view=sccm-ps'
     
    RemovedCmdletNames='test'
 
    RemovedAliasNames=$null
 
    DeprecatedCommandNames=@(
      'Add-CMCertificateRegistrationPoint',
      'Import-CMClientCertificatePfx',
      'Import-CMWirelessProfileConfigurationItem',
      'New-CMCertificateProfilePfx',
      'New-CMCertificateProfileScep',
      'New-CMCertificateProfileTrustedRootCA',
      'New-CMClientCertificateProfileConfigurationItem',
      'New-CMEmailProfile',
      'New-CMRootCertificateProfileConfigurationItem',
      'New-CMVpnProfileConfigurationItem',
      'New-CMWirelessProfile',
      'New-CMWirelessProfileConfigurationItem',
      'Set-CMCertificateProfilePfx',
      'Set-CMCertificateProfileScep',
      'Set-CMCertificateProfileTrustedRootCA',
      'Set-CMCertificateRegistrationPoint',
      'Set-CMClientCertificateProfileConfigurationItem',
      'Set-CMEmailProfile',
      'Set-CMVpnProfileConfigurationItem',
      'Set-CMWirelessProfile',
      'Set-CMWirelessProfileConfigurationItem'
    )
 
    UnresolvedBugCommandNames=@()
 
    ChangedCommandNames=@(
      'Add-CMManagementPoint',
      'Add-CMReportingServicePoint',
      'Get-CMObjectSecurityScope',
      'New-CMCloudManagementGateway',
      'New-CMCoManagementPolicy',
      'New-CMComplianceRuleRegistryKeyPermission',
      'Add-CMComplianceSettingWqlQuery',
      'Set-CMClientSettingComplianceSetting',
      'Set-CMClientSettingClientCache',
      'Set-CMClientSettingComputerRestart',
      'Set-CMClientSettingEndpointProtection',
      'Get-CMNotification',
      'New-CMFolder',
      'Get-CMFolder',
      'Remove-CMFolder',
      'Set-CMFolder',
      'Move-CMObject',
      'Add-CMObjectSecurityScope',
      'Remove-CMObjectSecurityScope',
      'Start-CMCloudManagementGateway',
      'Stop-CMCloudManagementGateway'
    )
 
    BreakingChangesCommandNames=@()
 }
 