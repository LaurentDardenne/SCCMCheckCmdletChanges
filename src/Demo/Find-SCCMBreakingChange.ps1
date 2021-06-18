$PowershellPathToScan=@(
'..\Src\ \Modules'
)

$CSharpPathToScan=@(
  '..\Deploiement'
)

$Files=@(
  ($PowershellPathToScan|Get-ChildItem -include *.ps1,*.psm1 -Recurse -File)
  ('…\Src'|Get-ChildItem -include *.ps1,*.psm1 -File)
  ($CSharpPathToScan|Get-ChildItem -include *.cs -Recurse -File|Where-Object {$_.DirectoryName -notmatch '^Bin$|^Obj$'})
)

Import-Module '..\Tools\Modules\SCCMLibraryChanges\SCCMLibraryChanges.psd1' -force
#Find-CommandName -PathToScan $Files.FullName
$R=Find-CommandName -PathToScan $Files.FullName
$R|Sort-Object Version,Name,Path|Export-Csv C:\Temp\Release.csv -Delimiter ';' -NoTypeInformation
Invoke-Item C:\Temp\Release.csv
