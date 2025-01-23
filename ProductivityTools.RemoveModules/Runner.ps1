Clear-Host
Set-Location $PSScriptRoot

Import-Module .\ProductivityTools.RemoveModules.psm1 -Force 
Remove-ProductivityToolsModules
#Remove-Modules -Name ProductivityTools. -StartsWith -Verbose