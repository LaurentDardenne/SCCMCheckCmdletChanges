#NO FUNCTIONAL JUST TO CONTAIN A POWERSHELL KEYWORD 
try{
   $Name = Get-CMApplication -Name "$appName"
   Set-CMScriptDeploymentType -ApplicationName $Name -DeploymentTypeName $Type.Name -ContentLocation $Location -UninstallOption SameAsInstall -force
   Export-CMPackage -Id "CS100001" -WithContent  -ExportFilePath "\\localhost\c$\temp\Demo.zip"
}catch{
   LogError $_
}
 