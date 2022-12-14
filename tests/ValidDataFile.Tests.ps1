$DatasDirectory="$PsScriptRoot\Datas"
$ModuleDirectory="$PsScriptRoot\..\Src\Module"

Import-Module "$ModuleDirectory\SCCMCheckCmdletChanges.psd1"

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
    Context "Get-InvalidVersionNumber." {
       It "Valid version number" {
        InModuleScope 'SCCMCheckCmdletChanges' -Parameters @{ ValidVersion = $global:ValidVersions } {
            $MustBeValidVersion = [System.Predicate[string]] { param($Version) Test-SccmVersion -InputObject $Version}
            [System.Array]::TrueForAll($ValidVersion,$MustBeValidVersion) | Should -be $True
         }
       }

       It "Invalid version number" {
        InModuleScope 'SCCMCheckCmdletChanges' -Parameters @{ InValidVersion = $global:InValidVersions } {
            $MustBeInvalidVersion = [System.Predicate[string]] { param($Version) (Test-SccmVersion -InputObject $Version) -eq $false}
            [System.Array]::TrueForAll($InValidVersion,$MustBeInvalidVersion) | Should -be $True
         }
       }

       It "Valid version number with PassThru parameter" {
        InModuleScope 'SCCMCheckCmdletChanges' {
            $Result=@('0001','2312' |Test-SccmVersion -PassThru)
            $Result.Count| Should -Be 0

            $Result='2312' |Test-SccmVersion -PassThru
            $Result| Should -Be $null
         }
       }  

       It "Invalid version number with PassThru parameter" {
        InModuleScope 'SCCMCheckCmdletChanges' {
            $Result='0000','2312' |Test-SccmVersion -PassThru
            $Result | Should -BeExactly '0000'

            $Result=@('0000','2313' |Test-SccmVersion -PassThru)
            $Result.Count | Should -Be 2
         }
       }       

       It "Invalid version numbers with PassThru parameter" {
        InModuleScope 'SCCMCheckCmdletChanges' -Parameters @{ InvalidVersions = $global:InValidVersions;Validversions= $global:ValidVersions} {
            $AllVersions = $InValidVersions + $ValidVersions
             #Return the contains of $InValidVersions
            [string[]]$Result=$AllVersions |Test-SccmVersion -PassThru
            
            $Set = New-Object System.Collections.Generic.HashSet[String](,[string[]]$AllVersions)
            #Remove $InValidVersions, remain $ValidVersions
            $Set.ExceptWith($Result)
            $Set.Count -eq $ValidVersions.Count | Should -be $True
         }
       }
    }
}