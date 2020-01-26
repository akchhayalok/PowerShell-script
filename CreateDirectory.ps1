param([Parameter(Mandatory=$true)][string] $Location)
try{
New-Item -Path $Location -ItemType Directory
Write-Host "Directory created successfully"
}
catch
{
 Write-Host "Cannot create a directory"
}