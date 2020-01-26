$LogTime = Get-Date -Format "MM-dd-yyyy_hh-mm-ss"
$folder = Get-Date -Format "dd-MM-yyyy"

if ($folder)
{
    {
      New-Item -ItemType file -Path "C:\users\akchhay.alok\$folder\$LogTime.log"
      Add-Content "C:\users\akchhay.alok\$folder\$LogTime.log" "Start of file"
    }
   
}
else
{
    New-Item -Path "C:\users\akchhay.alok\$folder" -ItemType Directory
    New-Item -ItemType file -Path "C:\users\akchhay.alok\$folder\$LogTime.log"
    Add-Content "C:\users\akchhay.alok\$folder\$LogTime.log" "End of file"
    
}