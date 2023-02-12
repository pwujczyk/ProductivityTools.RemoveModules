Clear-Host
Set-Location $PSScriptRoot

Import-Module .\ProductivityTools.RemoveModules.psm1 -Force 
Remove-Modules -Name ProductivityTools. -StartsWith -Verbose