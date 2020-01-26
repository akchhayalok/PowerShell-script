#Function is used to get the SQL Server Service Status whether it's Running , stopped or etc'

param([Parameter(Mandatory=$true)][string] $ServerName)

try
{
	$object = Get-service -ComputerName $ServerName  | where {($_.name -like "MSSQL$*" -or $_.name -like "MSSQLSERVER" -or $_.name -like "SQLSERVERAGENT" -or $_.name -like "SQL Server (*") }

	if ($object)
	{
		$instDetails= $object |select Name,Status
		$instDetails
	}else
	{
	"0 SQL Server instances discovered"
	}
}
catch
{
	return $false
}