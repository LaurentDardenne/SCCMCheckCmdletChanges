#NO FUNCTIONAL JUST TO CONTAIN A POWERSHELL KEYWORD 
try{
   $Name = Get-CMApplication -Name "$appName"
   Set-CMScriptDeploymentType -ApplicationName $Name -DeploymentTypeName $Type.Name -ContentLocation $Location -UninstallOption SameAsInstall -force
}catch{
   LogError $_
}
 