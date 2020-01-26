#Function to Check the Virtual Directory Exisits of not
#$rootVirtualDir is mandatory parameter.
param([Parameter(Mandatory=$true)] [string] $rootVirtualDir)

Import-Module -name WebAdministration 

try
{
	$vdir = Get-WebApplication -site 'Default Web Site' -Name $rootVirtualDir

	if($vdir -eq $null)
	{
		"Does Not Exists"
	}
	else
	{
		"Exists"
	}
}
catch
{
	return $false;
}


