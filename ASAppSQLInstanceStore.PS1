Param([string] $storeName, [string] $connectionString)

Import-Module ApplicationServer

try
{
	Add-ASAppSQLInstanceStore -Root -Name $storeName -ConnectionStringName $connectionString

	return $true 
}
catch
{
	return $false
}