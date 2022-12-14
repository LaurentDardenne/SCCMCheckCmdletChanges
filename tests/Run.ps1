
$Configuration = New-PesterConfiguration

#$Configuration.filter.Tag=('Version') #DataStructure, version

$Configuration.Output.Verbosity = ('Detailed')

#The response time of a call to Find-Module on PSGallery can be degraded (between 30 and 60 seconds), where Myget responds between 3 and 6 seconds.
Invoke-Pester -Configuration $Configuration