#Script to copy File nad rename, set attrubute to normal by overwriting file if exists
function CopyFile
{
    param(
    [Parameter(Mandatory=$true)][string] $sourcepath,
    [Parameter(Mandatory=$true)][string] $destpath
    )

    if (Test-Path -Path $sourcepath)
    {
     
     Write-host "source file already exists"
     return $false   
   
    }
    else
    {
       Get-Item $sourcepath | foreach {$_.Attributes = 'Normal'}
       Copy-Item -Path $sourcepath -Destination $destpath -Force
       Rename-Item -Path $destpath -NewName "web.config"
     
       return $true
     
    }
}
CopyFile
