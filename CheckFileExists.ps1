# script to check whethere file exists or not, if not then create it
param(
[Parameter(Mandatory=$true)][string]$filePath
)
if((Test-Path -Path $filePath) -eq $False)
{
 New-Item -ItemType File -Path $filePath -Force
}
else
{
return $true
}

