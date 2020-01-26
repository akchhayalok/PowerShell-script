# Create scheduled task by importing xml file
$taskname = "Moving Optio"
$User = "NT AUTHORITY\SYSTEM" 
$xmlPath = "C:\ProgramData\Optio\OECI\8.0\spibin\Move_Optio_Files.xml"
$content =  Get-content $xmlPath |Out-String

Register-ScheduledTask -TaskName $taskname -User $User -Xml $content