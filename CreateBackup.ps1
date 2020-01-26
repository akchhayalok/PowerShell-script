# script to take backup of a file with timestamp and set acl from original fileparam([Parameter(Mandatory=$true)][string] $scrpath)$LogTime = Get-Date -Format "MM-dd-yyyy_hh-mm-ss"
$destpath = "$scrpath $LogTime"
$destfile = Copy-Item -Path $scrpath -Destination $destpath  -Force
$scracl = get-acl -Path $scrpath
Set-Acl -Path $destpath -AclObject $scracl