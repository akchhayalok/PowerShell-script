param([Parameter(Mandatory=$true)][string]$Poolname)
Import-Module webadministration
try
{
 Start-WebAppPool -Name $Poolname
}
catch
{
Write-Host "Please restart manually"
}