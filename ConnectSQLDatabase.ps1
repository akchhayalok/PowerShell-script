# Script to connect to sql database and execute commands 
param(
[Parameter(Mandatory=$true)][string]$SQLServer,
[Parameter(Mandatory=$true)][string]$SQLDBName,
[Parameter(Mandatory=$true)][string]$uid,
[Parameter(Mandatory=$true)][string]$pwd
)
# Variables for conencting to sql server and database 
#$SQLServer = "PSBET-EFSQ01T.corp.powerschool.int" #SQL server
#$SQLDBName = "finplus_attach" #Database name
# Credential used to connect to sql server

# Query to run on a server
$SqlQuery = "USE finplus_attach;SELECT * FROM sys.tables"
$SqlConnection = New-Object System.Data.SqlClient.SqlConnection
$ConnectionString = Server = $SQLServer; Database = $SQLDBName; Integrated Security = TRUE; Username = $uid; Password = $pwd;
$SqlCmd = New-Object System.Data.SqlClient.SqlCommand
$SqlCmd.CommandText = $SqlQuery
$SqlCmd.Connection = $SqlConnection
$SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
$SqlAdapter.SelectCommand = $SqlCmd
