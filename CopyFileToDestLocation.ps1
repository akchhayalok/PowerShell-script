# Script to Copy file if it doesn't exist in the destination
param(
[Parameter(Mandatory=$true)][string]$fileName,
[Parameter(Mandatory=$true)][string]$sourcePath,
[Parameter(Mandatory=$true)][string]$destPath
)
if((Test-Path -Path $fileName) -eq $false)
{
 Copy-Item -Path $sourcePath -Destination $destPath
}
else
{
 Write-Output "File is already present"
 return true;
}