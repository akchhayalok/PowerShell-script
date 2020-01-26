#function to test the databse connection status

param([Parameter(Mandatory=$true)][string]$ServerName,[string]$DatabaseName,[Parameter(Mandatory=$true)] [string]$UserName ,[Parameter(Mandatory=$true)] [string]$Password)
import-module SqlServer
$ErrorActionPreference = 'Stop'     
try {         
	$ConnectionString = 'Data Source={0};database={1};User ID={2};Password={3}' -f $ServerName,$DatabaseName,$UserName,$Password        
	$sqlConnection = New-Object System.Data.SqlClient.SqlConnection $ConnectionString        
	$sqlConnection.Open()        
	## This will run if the Open() method does not throw an exception         
	$true     
} 
catch 
{         
	   $false 
} 
finally 
{
    ## Close the connection when we're done
    $sqlConnection.Close()
}

