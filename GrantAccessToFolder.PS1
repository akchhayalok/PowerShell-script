﻿#Function to provice access a folder

param([string] $ServerName,[string] $folderPath,[string] $domain,[string]$userName)

try{
$Path = "\\$ServerName\$folderPath"
$ACL = Get-ACL -Path $Path
	$true
}
catch
{
	$false
}
