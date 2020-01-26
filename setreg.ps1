
$acl = Get-Acl 'HKLM:\SYSTEM\CurrentControlSet\Services\EventLog'
$idRef = [System.Security.Principal.NTAccount]("Network service")
$regRights = [System.Security.AccessControl.RegistryRights]::FullControl
$inhFlags = [System.Security.AccessControl.InheritanceFlags]::None
$prFlags = [System.Security.AccessControl.PropagationFlags]::None
$acType = [System.Security.AccessControl.AccessControlType]::Allow
$rule = New-Object System.Security.AccessControl.RegistryAccessRule ($idRef, $regRights, $inhFlags, $prFlags, $acType)
$acl.AddAccessRule($rule)
$acl | Set-Acl -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\EventLog'

$acl = Get-Acl 'HKLM:\SYSTEM\CurrentControlSet\Services\EventLog\Security'
$idRef = [System.Security.Principal.NTAccount]("Network service")
$regRights = [System.Security.AccessControl.RegistryRights]::FullControl
$inhFlags = [System.Security.AccessControl.InheritanceFlags]::None
$prFlags = [System.Security.AccessControl.PropagationFlags]::None
$acType = [System.Security.AccessControl.AccessControlType]::Allow
$rule = New-Object System.Security.AccessControl.RegistryAccessRule ($idRef, $regRights, $inhFlags, $prFlags, $acType)
$acl.AddAccessRule($rule)
$acl | Set-Acl -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\EventLog\Security'
