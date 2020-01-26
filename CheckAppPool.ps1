param([Parameter(Mandatory=$true)][string]$poolname)
import-module webadministration
if(Test-Path IIS:\AppPools\$poolname)
{
"AppPool is already there"
return $true;
}
else
{
"AppPool is not present"
return $false;
}