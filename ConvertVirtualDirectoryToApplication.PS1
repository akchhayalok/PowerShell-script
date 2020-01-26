#Function to convert Virtual Directory to Application , and associate VD to AppPool
#Both parameters are mandatory

param([Parameter(Mandatory=$true)][string] $pVdirName ,[Parameter(Mandatory=$true)] [string] $pAppPoolName)

Import-Module -name WebAdministration

try
{
	ConvertTo-WebApplication -PSPath "IIS:\Sites\Default Web Site\$pVdirName" -ApplicationPool $pAppPoolName -Force
	return $true;
}
catch
{
	return $false;
}