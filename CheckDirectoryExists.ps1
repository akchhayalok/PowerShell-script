# Script for checking whether directory exists or not
# Provide full location of file or folder you need to check in DirLoc
param([Parameter(Mandatory=$true)][string]$DirLoc)
$result = Test-Path -Path $DirLoc
if($result)
{
 return $true
}
else
{
 return $false
}
