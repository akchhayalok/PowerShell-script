param(
[Parameter(Mandatory=$true)][string]$nodeName,
[Parameter(Mandatory=$true)][string]$xmlPath
)
$xml=[xml]( Get-Content $xmlPath )
$node = $xml.InstallStatus.Methods.$nodeName | where {$_.isError -eq 'False'}
    $node.isError='True'
    $xml.save($xmlPath)