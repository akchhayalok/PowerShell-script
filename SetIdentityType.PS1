#Function to create a AppPool and set AspNetVersion for the same, if AppPool is already created, then just set the version.
#Both paramaters are mandatory

param([Parameter(Mandatory=$true)] [string] $pAppPoolName , [int] $pIdentity)
#importing Library
Import-Module -name WebAdministration

try
{
		$appPool = Get-Item IIS:\AppPools\$pAppPoolName

		$appPool.processModel.identityType = $pIdentity
		$appPool | Set-Item

		return $true;

}
catch
{
	return $false;
}

