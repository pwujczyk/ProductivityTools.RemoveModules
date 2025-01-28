function Remove-Modules
{
	 	[cmdletbinding()]
 	param(
 		[Parameter(Mandatory=$true)]
 		[string]$Name,

 		[Parameter(Mandatory=$false)]
		[Switch]$StartsWith

 	)

	start pwsh.exe "$PSScriptRoot\PerformJob.ps1 $Name $StartsWith" -Verb RunAs
}
function Remove-ProductivityToolsModules
{
	[cmdletbinding()]
	param()

	Remove-Modules -Name ProductivityTools. -StartsWith
}

Export-ModuleMember Remove-Modules
Export-ModuleMember Remove-ProductivityToolsModules