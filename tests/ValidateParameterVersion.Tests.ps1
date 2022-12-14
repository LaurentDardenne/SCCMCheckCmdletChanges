$Global:DatasDirectory="$PsScriptRoot\Datas"
$ModuleDirectory="$PsScriptRoot\..\Src\Module"

Import-Module "$ModuleDirectory\SCCMCheckCmdletChanges.psd1" -Force

[string[]]$global:ValidVersions=@(
    '0001',
    '2201',
    '2312',
    '5410'
)

[string[]]$global:InvalidVersions=@(
    $null,
    '',
    'a',
    '-1',
    '1.5',
    '1',
    "`t 1",
    '10e2',
    '00',
    '0000',
    '0013'
)


Describe 'Test requirements' {
    Context "Get-SCCMCommandReleaseNote"  -Tag 'Version' {
       It "Valid version number" {
        { Get-SCCMCommandReleaseNote -Version '0001'} | Should -Not -Throw
       }

       It "Valid version numbers" {
        { Get-SCCMCommandReleaseNote -Version '0001','2207'} | Should -Not -Throw
       }       

       It "Invalid version number" {
        $Err = { Get-SCCMCommandReleaseNote -Version '0000'} | Should -Throw -PassThru 
        $Err.Exception.Message | Should -match 'The following version numbers are invalid : 0000'
       }

       It "Invalid version numbers" {
        $Err = { Get-SCCMCommandReleaseNote -Version '0000','2207','test'} | Should -Throw -PassThru 
        $Err.Exception.Message | Should -match 'The following version numbers are invalid : 0000 test'
       }       
    }
}