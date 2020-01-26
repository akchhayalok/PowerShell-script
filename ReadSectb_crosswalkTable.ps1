<# script to read sectb_crosswalk table from database 

Provide the following details and it will read sectb_crosswalk table

1 . Database
2.  Username
3. Password
4. Server instance
**************************************
#>
param(
[Parameter(Mandatory=$true)][string]$server,
[Parameter(Mandatory=$true)][string]$dbname,
[Parameter(Mandatory=$true)][string]$Username,
[Parameter(Mandatory=$true)][string]$Password
)
$usermap = Invoke-Sqlcmd -ServerInstance $server -Database $dbname -Username $Username -Password $Password -Query "SELECT * FROM sectb_crosswalk;"
Write-Output $usermap | ConvertTo-XML -As Document -Depth 3
