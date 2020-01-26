﻿# script to take backup of a file with timestamp and set acl from original file
$destpath = "$scrpath $LogTime"
$destfile = Copy-Item -Path $scrpath -Destination $destpath  -Force
$scracl = get-acl -Path $scrpath
Set-Acl -Path $destpath -AclObject $scracl