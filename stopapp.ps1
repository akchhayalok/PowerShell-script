param([Parameter(Mandatory=$true)][string] $AppPool)
#importing Library
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
import-Module WebAdministration 
Stop-WebAppPool $AppPool
}

#Import-Module -name WebAdministration
#try
#{
#	invoke-command stop-WebAppPool $AppPool
#	return $true;
#}
#catch
#{
#	return $false;
#}