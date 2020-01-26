Param(
    [String] $ProfileFilePath,
	[String] $ConfigFilePath,
	[String] $ConName,
	[String] $KeyText,
	[String] $SqlQuery
)

try
{

	if([System.IO.File]::Exists($ProfileFilePath))
	{
		Get-Content $ProfileFilePath | ForEach-Object {
			if($_ -match $KeyText)
			{
				exit "CatalogEncryptKeyExists"
			}
		}
	}

	if([System.IO.File]::Exists($ConfigFilePath))
	{
		$doc = (Get-Content $ConfigFilePath) -as [Xml]
		$root = $doc.get_DocumentElement()
		$sb = New-Object System.Data.Common.DbConnectionStringBuilder
		$conn = New-Object System.Data.SqlClient.SqlConnection
 		foreach($cs in $root.connectionStrings.add)
        {
           if($cs.name -eq $ConName)
           {
				$sb.set_ConnectionString($cs.connectionString)
				$conn.ConnectionString = $cs.connectionString
				break
           }
        }

		if($sb)
		{
			if ([string]::IsNullOrWhiteSpace($sb["User Id"]) -or [string]::IsNullOrWhiteSpace($sb["Password"]))
            {
				exit "CatalogCredError"
			}
			else
			{
				$conn.Open()
				$cmd = New-Object System.Data.SqlClient.SqlCommand($SqlQuery,$conn)
				$rdr = $cmd.ExecuteReader()
				$profileId = $null
				while($rdr.Read())
				{
					$profileId = $rdr[0].ToString()
				}
				
				$profileId
			}
		}
		else
		{
			"CatalogCredError"
		}
	}
	else
	{
		"ConfigNotExists"
	}
}
catch
{
	"CatalogCredError"
}