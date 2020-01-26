# script to change attrib value for single node
param(
[Parameter(Mandatory=$true)][string]$xmlpath,
[Parameter(Mandatory=$true)][string]$nodepath,
[Parameter(Mandatory=$true)][string]$key,
[Parameter(Mandatory=$true)][string]$value
)

#Declaring function
function ChangeXML
{
    $xml=New-Object XML
    $xml.Load($xmlpath)
    if (Test-Path $xmlpath)
    {
      $node = $xml.SelectSingleNode($nodepath) #For example /settings/conguration
      $node.SetAttribute($key, $value) #For example "type","IP"
      $xml.Save($xmlpath)
      Write-Host "Successfully updated xml"
      return $true
    }
    else
    {
     Write-Host "XML does not exist"
     return $false
    }
}
ChangeXML #calling function