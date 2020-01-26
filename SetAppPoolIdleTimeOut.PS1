#Function to set the IdleTimeout of the AppPool
#Both $pAppPoolName and $pAppPoolIdleTimeout are mandatory Parameters.

param([Parameter(Mandatory=$true)][string] $pAppPoolName, [Parameter(Mandatory=$true)][int] $pAppPoolIdleTimeout)

Import-Module -name WebAdministration

try
{
		If(-Not(Test-Path IIS:\AppPools\$pAppPoolName))
		{
	
			$appPool = New-Item IIS:\AppPools\$pAppPoolName
			$appPool | Set-ItemProperty -Name "idleTimeout" -Value $pAppPoolIdleTimeout
			return $true;
		}
		else
		{
			$appPool = Get-IISAppPool $pAppPoolName
			$appPool | Set-ItemProperty -Name "idleTimeout" -Value $pAppPoolIdleTimeout
			return $true;
		}
}
catch
{
	return $false;
}
