$logtime= $LogTime = Get-Date -Format "MM-dd-yyyy_hh-mm-ss"
$PSlogs = get-date
$logdir = "c:\users\akchhay.alok\$PSlogs"
New-Item -ItemType Directory -Path ("c:\users\akchhay.alok\$logdir")
$logfile = New-Item -Path ("$logdir\$logtime.log") -ItemType File -Force
set-Content $logfile "Writing text to log file"
Add-Content $logfile "Appending text"