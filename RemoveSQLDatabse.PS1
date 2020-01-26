#function to remove the SQL databases from DB

param([Parameter(Mandatory=$true)][string] $DBName,[Parameter(Mandatory=$true)][string] $ServerName,[Parameter(Mandatory=$true)][string] $UserName,[Parameter(Mandatory=$true)][string] $Password)

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

		$DB = $Server.databases["$DBName"]
		$DB.Drop()
		$true

	}
	catch
	{
		return $false
	}


		