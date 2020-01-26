#Function to create a Virtual Directory with Physical Path 
#Both parameters are mandatory

param
(
[Parameter(Mandatory=$true)][string] $pVdirName ,
[Parameter(Mandatory=$true)][string] $pPhysicalPath
)
Import-Module -name WebAdministration
cd IIS:\Sites\
try
{
	New-WebApplication -Site "Default Web Site" -Name $pVdirName -PhysicalPath $pPhysicalPath  -Force
}
catch
{
	return $false;
}
