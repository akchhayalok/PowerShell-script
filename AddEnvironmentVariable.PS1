#function is to Add Environment Path param([Parameter(Mandatory=$true)][string] $varName ,[Parameter(Mandatory=$true)][string] $source)try{	$path = 'env:'+$varName	if (Test-Path $path) { 

		return $true 
	} 	else	{		[System.Environment]::SetEnvironmentVariable($varName, $source, "Machine")
			return $true
	}}
catch
{
	return $false
}
