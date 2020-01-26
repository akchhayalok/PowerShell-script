# Script for reading from xml file
param([Parameter(Mandatory=$true)][string]$xmlpath)
[xml]$xmldoc = get-content $xmlpath
$section = $xmldoc.configuration.configSections | Where-Object {$_.name -eq "Applicationnames"} | Select-Object type
Write-Output "The value of variable is $section"
