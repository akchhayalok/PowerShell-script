# Script to check file exist or not
param(
[Parameter(Mandatory=$true)][string]$fileName
)
if((Test-Path -Path $fileName) -eq $false)
{
 Write-Output "File is not present"
 return $false
}
else
{
 Write-Output "File is present"
 return true;
}