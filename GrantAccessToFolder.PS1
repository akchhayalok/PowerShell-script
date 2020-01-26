#Function to provice access a folder

param([string] $ServerName,[string] $folderPath,[string] $domain,[string]$userName)

try{
$Path = "\\$ServerName\$folderPath"
$ACL = Get-ACL -Path $Path$ruleDirection=[System.Security.AccessControl.AccessControlType]"Allow"$groupsOrUser = [System.Security.Principal.NTAccount]"$domain\$userName"$fileSystemRights = [System.Security.AccessControl.FileSystemRights]"FullControl"$inherit = [system.security.accesscontrol.InheritanceFlags]"ContainerInherit, ObjectInherit"$propagation = [system.security.accesscontrol.PropagationFlags]"None"$accessrule = New-Object system.security.AccessControl.FileSystemAccessRule(     $groupsOrUser, $fileSystemRights, $inherit, $propagation, $ruleDirection)$acl.AddAccessRule($accessrule)Set-ACL -Path $Path -AclObject $ACL 
	$true
}
catch
{
	$false
}

