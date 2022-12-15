#Requires -Module SCCMCheckCmdletChanges

$PowershellPathToScan=@(
'.\Examples'
)

$CSharpPathToScan=@(
  '.\Examples'
)

$Files=@(
  ($PowershellPathToScan|Get-ChildItem -include *.ps1,*.psm1 -Recurse -File)
  ($CSharpPathToScan|Get-ChildItem -include *.cs -Recurse -File|Where-Object {$_.DirectoryName -notmatch '^Bin$|^Obj$'})
)

Import-Module SCCMCheckCmdletChanges -force

Find-CommandName -Path $Files.FullName -VerifyCoreCLR
