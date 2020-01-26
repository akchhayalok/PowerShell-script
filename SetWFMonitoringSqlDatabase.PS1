Param([string] $connectionString)

try
{
Import-Module ApplicationServer

Initialize-ASMonitoringSqlDatabase -ConnectionString $connectionString -Force

$true
}
catch
{
	$false
}