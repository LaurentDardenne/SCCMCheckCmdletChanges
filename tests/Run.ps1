
$Configuration = New-PesterConfiguration

#$Configuration.filter.Tag=('Version') #DataStructure, version

$Configuration.Output.Verbosity = ('Detailed')

Invoke-Pester -Configuration $Configuration