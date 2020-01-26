param([Parameter(Mandatory=$true)][string]$poolname)
try
{
 Stop-WebAppPool -Name $poolname
}
catch
{
Write-Host "Please run as  admin rights"
}