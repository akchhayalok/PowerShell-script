##Method to create or configure the service
param([string]$serverName ,[string]$srvcName , [string]$binPath)

try
{
	$serviceExists = Get-Service -ComputerName $serverName -DisplayName $srvcName
	if($serviceExists)
	{
		##Stop the service if already exists
		Stop-Service $srvcName -Force
		sc.exe CONFIG $srvcName binPath= $binPath
		Stop-Service $srvcName -Force
		Set-Service -ComputerName $serverName -Name $srvcName -DisplayName $srvcName -Description $srvcName -StartupType Automatic 
		Start-Service $srvcName
	}
	else
	{
		New-Service -Name $srvcName -DisplayName $srvcName -BinaryPathName $binPath -Description $srvcName -StartupType Automatic 
		Start-Service $srvcName
	}
	$true
}
catch
{
	$false;
}
