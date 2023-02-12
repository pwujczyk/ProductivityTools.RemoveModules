function Remove-ModulesFromDirectory()
{
	[cmdletbinding()]
	param(
		[Parameter(Mandatory=$true)]
		[string]$Directory,

		[Parameter(Mandatory=$true)]
		[string]$Name,

		[Parameter(Mandatory=$false)]
		[Switch]$StartsWith
	)
		
	Write-Output $Directory	
	if (Test-Path $directory)
	{
		$modules=Get-ChildItem -Path $Directory
	
		foreach($module in $modules)
		{
			if($StartsWith)
			{
				if ($module.Name.StartsWith($Name))
				{
					 Remove-Item -Path $module -Force -Recurse
				}
			}
			else
			{
				if ($module.Name -eq $Name )
				{
					Remove-Item -Path $module -Force -Recurse
				}
			}
		}
	}
}

function Remove-Modules
{
	[cmdletbinding()]
	param(
		[Parameter(Mandatory=$true)]
		[string]$Name,

		[Parameter(Mandatory=$false)]
		[Switch]$StartsWith

	)
	
	$moduelsPath=$env:PSModulePath
	$pathArray=$moduelsPath.Split(';')
	foreach($dir in $pathArray)
	{
		Write-Host $dir
		Remove-ModulesFromDirectory -Directory $dir -Name $Name -StartsWith:$StartsWith
	}
}

function RemoveProductivityTools-Modules
{
	Remove-Modules -Name ProductivityTools. -StartsWith
}




Export-ModuleMember Remove-Modules
Export-ModuleMember RemoveProductivityTools-Modules