# script for enabling 32 bit application on win64 bit
Import-Module WebAdministration
Set-ItemProperty IIS:\AppPools\$poolname -name "enable32BitAppOnWin64" -Value "true"