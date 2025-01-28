param(
    [Parameter(Mandatory=$True, Position=0, ValueFromPipeline=$false)]
    [System.String]
    $Name,

    [Parameter(Mandatory=$True, Position=1, ValueFromPipeline=$false)]
    [System.String]
    $StartsWith
)



function Remove-ModulesFromDirectory()
{
	[cmdletbinding()]
	param(
		[Parameter(Mandatory=$true)]
		[string]$Directory,

		[Parameter(Mandatory=$true)]
		[string]$Name,

		[Parameter(Mandatory=$false)]
		[String]$StartsWith
	)
	Write-Host "Removing modules from directory: $($Directory)" -ForegroundColor Yellow
	if (Test-Path $directory)
	{
		$modules=Get-ChildItem -Path $Directory
		Write-host "Found $($modules.Length) modules"
		Write-host $modules
	
		foreach($module in $modules)
		{
			if($StartsWith -eq "True")
			{
				if ($module.Name.StartsWith($Name))
				{
					Remove-Item -Path $module.FullName -Force -Recurse
					Write-Host "Removing path $($module.FullName)" -ForegroundColor White
				}
			}
			else
			{
				if ($module.Name -eq $Name )
				{
					Remove-Item -Path $module.FullName -Force -Recurse
					Write-Host "Removing path $($module.FullName)" -ForegroundColor White
				}
			}
		}
	}
}

function RemoveModules
{
	[cmdletbinding()]
	param(
		[Parameter(Mandatory=$true)]
		[string]$Name,

		[Parameter(Mandatory=$false)]
		[String]$StartsWith

	)
	Write-Output "Looking for the $($Name) Modules"
	$moduelsPath=$env:PSModulePath
	$pathArray=$moduelsPath.Split(';')
	Write-Output "All module directories:"
	Write-Output $pathArray
	foreach($dir in $pathArray)
	{
		Write-Host $dir
		Remove-ModulesFromDirectory -Directory $dir -Name $Name -StartsWith $StartsWith
		Write-Host "Push enter"
		Read-Host
	}
}


function StopPowershellInstances()
{
	Write-Host "Getting powershell processes"
	$processes=Get-Process -Name pwsh*
	Write-Host "Found $($processes.Length) powershell processes"
	foreach($proces in $processes)
	{
		if ($proces.id -ne $pid)
		{
			Write-Host "Stopping process $($proces.Id)"
			Stop-Process $proces
		}
	}
}

Write-Host "Hello"
Write-host "Name $Name"
Write-host "StartsWith $StartsWith"
StopPowershellInstances
RemoveModules $Name $StartsWith
Write-Host "Removal finished"
Read-Host


