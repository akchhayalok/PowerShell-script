Param([string] $connectionString)

try
{
Import-Module ApplicationServer

Initialize-ASPersistenceSqlDatabase -ConnectionString $connectionString -Force

$true
}
catch
{
	$false
}