param([string] $Dir)

$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(
        [Security.Principal.WindowsBuiltInRole] "Administrator")
		  if($isAdmin -eq "Administrator")
			{
               "AdminRightsExists";
            }
          else
            {   
                "AdminRightsNotExists"
			}