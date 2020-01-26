#Function to create AppPool and set corresponding apppool parameters

param([Parameter(Mandatory=$true)][string] $pAppPoolName, 
	[Parameter(Mandatory=$true)][int]$pPipeLineMode , 
	[Parameter(Mandatory=$true)][string]$pEnable32BitAppOnWin64 , 
	[Parameter(Mandatory=$true)][string]$pSetFailureProtection, 
	[Parameter(Mandatory=$true)][int]$pAppPoolType, 
	[string]$pUserName , 
	[string]$pPassword, 
	[Parameter(Mandatory=$true)][string]$pRomoveAppPool)

#importing Library
Import-Module -name WebAdministration

try
{
	If((Test-Path IIS:\AppPools\$pAppPoolName))
	{
		if($pRomoveAppPool)
		{
			Remove-WebAppPool $pAppPoolName
		}
	}
	If(-Not(Test-Path IIS:\AppPools\$pAppPoolName))
	{
	 # Creating new AppPool and set the managedruntime version
    
	   $appPool = New-Item IIS:\AppPools\$pAppPoolName
		if($pAppPoolType -eq 3)
		{
			$appPool.processModel.userName =  $pUserName
			$appPool.processModel.password = $pPassword
			$appPool.processModel.identityType = $pAppPoolType
			$appPool | Set-Item
		}
		else
		{
			$appPool.processModel.identityType = $pAppPoolType
			$appPool | Set-Item
		}
	   $appPool.managedPipelineMode = $pPipeLineMode
	   $appPool | Set-Item
	   $appPool.enable32bitapponwin64 = $pEnable32BitAppOnWin64
	   $appPool | Set-Item
	   
	  	if($pSetFailureProtection)
		{
			$appPool.failure.rapidFailProtectionInterval =  2
			$appPool | Set-Item
			$appPool.failure.rapidFailProtectionMaxCrashes = 1000
			$appPool | Set-Item
		}

		return $true;
	}
}
catch
{
	return $false;
}