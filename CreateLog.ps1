<# script to log for powershell script 
.Description Create a log file 


#>
param(
[Parameter(Mandatory=$true)][string]$logname,
[Parameter(Mandatory=$true)][string]$logpath,
[Parameter(Mandatory=$true)][string]$message
)

# check if log file exists

$currentdatetime = Get-Date -Format "dd-mm-yyy hh-mm-ss"
$fullpath = Join-Path -Path "$logpath\$currentdatetime" -ChildPath "$currentdatetime $logname"
function LogMessage
{
 
 
  if (Test-Path -Path $fullpath)
  {
   
  Add-Content -Path $fullpath -Value  "$currentdatetime $message"
  }
  else
  {

  if(!Test-Path -Path $logpath)
  {
   if(!Test-path -Path $currentdatetime)
   {
   New-Item -ItemType Directory -Path "$logpath\$currentdatetime"  
  Add-Content -Path $fullpath -Value "$currentdatetime $message"
  }
  else
  {
   New-Item -ItemType Directory -Path $logpath
   New-Item -ItemType File -Path $logname
   Add-Content -Path $fullpath -Value Get-Date -Format "dd-mm-yyy hh-mm-ss" $message
  }
 }
}
else
{
 New-Item -ItemType Directory -Path $currentdatetime
}
}
LogMessage 