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
    Context "Get-InvalidVersionNumber"  -Tag 'Version' {
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

       It "Invalid version numbers with PassThru parameter" {
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

    Context "Test-ReleaseNoteRequirement" -Tag 'DataStructure' {

        'InvalidKeyContent.psd1'
        'InvalidVersionNumber.psd1'
        'MissingKey.psd1'

        It "Missing Key" {
           
           InModuleScope 'SCCMCheckCmdletChanges' -Parameters @{ Path = "$global:DatasDirectory\MissingKey.psd1" } {
             $Datas=Import-PowerShellDataFile $Path
             
             $Err = {Test-ReleaseNoteRequirement -Datas $Datas -FileName $Path } | Should -Throw -PassThru
             $Err.Exception.Message | Should -match 'The required keys do not exist : RemovedAliasNames'
          }
        }
             

        It "Invalid version number" {
            InModuleScope 'SCCMCheckCmdletChanges' -Parameters @{ Path = "$global:DatasDirectory\InvalidVersionNumber.psd1" } {
                $Datas=Import-PowerShellDataFile $Path

                $Err = {Test-ReleaseNoteRequirement -Datas $Datas -FileName $Path } | Should -Throw -PassThru 
                $Err.Exception.Message | Should -match "The key 'LibraryChangesForVersion' must contains an integer \(four digits in format 'yyMM'\)"
             }
        }    

        It "Content of 'RemovedCmdletNames' key is not an array" {
            
            InModuleScope 'SCCMCheckCmdletChanges' -Parameters @{ Path = "$global:DatasDirectory\InvalidKeyContent.psd1" } {
                $Datas=Import-PowerShellDataFile $Path

                $Err = {Test-ReleaseNoteRequirement -Datas $Datas -FileName $Path } | Should -Throw -PassThru 
                $Err.Exception.Message | Should -match "The key 'RemovedCmdletNames' must be of type Array"
             }
        }    

        It "Content of 'Url' key is not a valid URI" {
            
            InModuleScope 'SCCMCheckCmdletChanges' -Parameters @{ Path = "$global:DatasDirectory\InvalidUri.psd1" } {
                $Datas=Import-PowerShellDataFile $Path

                $Err = {Test-ReleaseNoteRequirement -Datas $Datas -FileName $Path } | Should -Throw -PassThru 
                $Err.Exception.Message | Should -match "The key 'Url' must contains an URL"
             }
        }       
    }
}