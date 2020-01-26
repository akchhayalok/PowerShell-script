#function to execute SQL Script from File

param([Parameter(Mandatory=$true)][string] $DBName,[Parameter(Mandatory=$true)][string] $ServerName,[Parameter(Mandatory=$true)][string] $UserName,[Parameter(Mandatory=$true)][string] $Password,[Parameter(Mandatory=$true)][string] $FilePath)
Import-Module SqlServer
# Load assemblies
       [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Management.Smo") | Out-Null
       [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SmoExtended") | Out-Null
      [Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.ConnectionInfo") | Out-Null
      [Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SmoEnum") | Out-Null	

	try
	{
		$Server=[Microsoft.SqlServer.Management.Smo.Server]($ServerName)

		$Server.ConnectionContext.LoginSecure = $false
		$Server.ConnectionContext.set_Login($UserName)
		$Server.ConnectionContext.set_Password($Password)

		$script_contents = Get-Content -Path $FilePath -Raw
		$tsql_to_run = $script_contents -split '\bGO\b'
		$Batch = New-Object -TypeName:Collections.Specialized.StringCollection 
        $Batch.AddRange($tsql_to_run) 

		$SmoDatabase = $Server.Databases.Item($DBName) 
	    $results  = $SmoDatabase.ExecuteWithResults($Batch)


		if($results.Tables -eq $null)
		{
			"0"
		}
		else
		{
			"1"
		}

		$results.Tables
	}
	catch
	{
		return $_.Exception.Message
	}