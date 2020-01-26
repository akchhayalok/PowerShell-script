#Function to create the SQl Database

param([Parameter(Mandatory=$true)][string] $DBName,[Parameter(Mandatory=$true)][string] $ServerName,[Parameter(Mandatory=$true)][string] $UserName,[Parameter(Mandatory=$true)][string] $Password)
import-Module SqlServer
# Load assemblies
        [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Management.Smo") | Out-Null
        [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SmoExtended") | Out-Null
        [Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.ConnectionInfo") | Out-Null
        [Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SmoEnum") | Out-Null

		$Server=[Microsoft.SqlServer.Management.Smo.Server]($ServerName)

		$Server.ConnectionContext.LoginSecure = $false
		$Server.ConnectionContext.set_Login($UserName)
		$Server.ConnectionContext.set_Password($Password)

		$exists = $false
		foreach($db in $Server.databases)
		{  
		if ($db.name -eq $DBName) 
			{
			$exists = $TRUE
			}
		}

		$exists
		