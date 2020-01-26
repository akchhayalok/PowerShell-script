#Function to create a AppPool and set AspNetVersion for the same, if AppPool is already created, then just set the version.
#Both paramaters are mandatory

param([Parameter(Mandatory=$true)] [string] $pAppPoolName, [Parameter(Mandatory=$true)] [string] $pAppPoolManagedRuntimeVersion)
#importing Library
Import-Module -name WebAdministration

try
{
	If(-Not(Test-Path IIS:\AppPools\$pAppPoolName))
	{
	  # Creating new AppPool and set the managedruntime version
	
		$appPool = New-Item IIS:\AppPools\$pAppPoolName
		$appPool | Set-ItemProperty -Name "managedRuntimeVersion" -Value $pAppPoolManagedRuntimeVersion
		return $true;
	}
	else
	{
		$appPool = Get-IISAppPool $pAppPoolName
		$appPool | Set-ItemProperty -Name "managedRuntimeVersion" -Value $pAppPoolManagedRuntimeVersion
		return $true;
	}
}
catch
{
	return $false;
}

