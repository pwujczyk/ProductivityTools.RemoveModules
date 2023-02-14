function Remove-Modules
{
	 	[cmdletbinding()]
 	param(
 		[Parameter(Mandatory=$true)]
 		[string]$Name,

 		[Parameter(Mandatory=$false)]
		[Switch]$StartsWith

 	)

	start powershell.exe "$PSScriptRoot\PerformJob.ps1 $Name $StartsWith"
}
function Remove-ProductivityToolsModules
{
	[cmdletbinding()]
	param()

	Remove-Modules -Name ProductivityTools. -StartsWith
}

Export-ModuleMember Remove-Modules
Export-ModuleMember Remove-ProductivityToolsModules