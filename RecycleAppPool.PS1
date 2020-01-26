#Function to recycle the AppPool
#$AppPool is amndatory parameter

param([Parameter(Mandatory=$true)][string] $AppPool)
#importing Library
Import-Module -name WebAdministration
try
{
	Restart-WebAppPool $AppPool
	return $true;
}
catch
{
	retunr $false;
}