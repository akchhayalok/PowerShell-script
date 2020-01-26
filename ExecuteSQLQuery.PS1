#Function to Execute SQL Query 

param([Parameter(Mandatory=$true)][string] $DBName,[Parameter(Mandatory=$true)][string] $ServerName,[Parameter(Mandatory=$true)][string] $UserName,[Parameter(Mandatory=$true)][string] $Password,[Parameter(Mandatory=$true)][string] $Query)
import-module SqlServer
# Load assemblies
    [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO") | Out-Null
    [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SmoExtended") | Out-Null
    [Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.ConnectionInfo") | Out-Null
    [Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SmoEnum") | Out-Null
	try
	{
		$Server=[Microsoft.SqlServer.Management.Smo.Server]($ServerName)

		$Server.ConnectionContext.LoginSecure = $false
		$Server.ConnectionContext.set_Login($UserName)
		$Server.ConnectionContext.set_Password($Password) 

		$SmoDatabase = $Server.Databases.Item($DBName) 
	    $results  = $SmoDatabase.ExecuteWithResults($Query)


		if($results.Tables -eq $null)
		{
			"0"
		}

		$results.Tables
	}
	catch
	{
		return $false
	}