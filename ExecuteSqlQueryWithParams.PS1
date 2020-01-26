#Function to execute SQL query with parameters.

param(
[Parameter(Mandatory=$true)][String]$ConnectionString,
[Parameter(Mandatory=$true)][String]$SqlQuery,
[Parameter(Mandatory=$true)][System.Collections.Specialized.StringCollection]$Params,
[String]$ExecType = $null
)
import-module sqlserver
$SqlConnection = new-object System.Data.SqlClient.SqlConnection
try
{
# 
	$SqlConnection.ConnectionString = $ConnectionString
	$SqlConnection.Open()
	$SqlCommand = $SqlConnection.CreateCommand()
	$SqlCommand.CommandText = $SqlQuery
	
	#$SqlCommand.Connection = $SqlConnection
	[String]$return = $null

	
	ForEach($param in $Params)
	{
		$items = $param.split("#")
		if($items.length -eq 3)
		{
		
			$guidVal =[GUID]::NewGuid()#($items[1]) # [System.guid]::New($items[1])
			
			$SqlCommand.Parameters.Add("""@"+$items[0]+"""", [System.Data.SqlDbType]::Text, 16) 
			$SqlCommand.Parameters["""@"+$items[0]+""""].Value = """"+$guidVal+""""
			#$SqlCommand.Parameters.AddWithValue("""@"+$items[0]+"""", """"+$guidVal+"""") | Out-Null		
		}
		elseif($items.length -eq 2)
		{  
			$SqlCommand.Parameters.Add("""@"+$items[0]+"""", [System.Data.SqlDbType]::VarChar) 
			$SqlCommand.Parameters["""@"+$items[0]+""""].Value = """"+$items[1]+""""
			#$SqlCommand.Parameters.AddWithValue("""@"+$items[0]+"""", """"+$items[1]+"""") | Out-Null
		}
	}
	##$Params.Keys | % { 
		#"key = $_ , value = " + $Params.Item($_)
		#$SqlCommand.Parameters.AddWithValue("""@"+$_+"""", """"+$Params.Item($_)+"""") | Out-Null
	#}
	
	if($ExecType)
	{
		if($ExecType -eq "ES")
		{
			$return = $SqlCommand.ExecuteScalar()
		}
		elseif($ExecType -eq "EN")
		{
		$SqlCommand.Parameters[0]
			$SqlConnection.ExecuteNonQuery()
			#$return
		}

		
		if($return -eq "1")
		{
			$return = "QuerySuccess"
		}
		else
		{
			$return = "QueryFailure"
		}

		Write-Host $return
	}
	else
	{
		# TODO : Need to write code for ExecuteReader if required.
		$DataAdapter = new-object System.Data.SqlClient.SqlDataAdapter $SqlCommand
		$dataset = new-object System.Data.Dataset
		$DataAdapter.Fill($dataset)
		Write-Host $dataset.Tables[0]
	}
}
Catch
{
	"QueryExecutionError"
	$_.Exception
}
finally
{
	$SqlConnection.Close()
}