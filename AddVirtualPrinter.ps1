# Script to add local printer to the current system
param(
[Parameter(Mandatory=$true)][string]$portName,
[Parameter(Mandatory=$true)][string]$printDriverName,
[Parameter(Mandatory=$true)][string]$name

)

$portExists = Get-Printerport -Name $portname -ErrorAction SilentlyContinue

if (-not $portExists) 
{
  Add-PrinterPort -name $portName 
}

$printDriverExists = Get-PrinterDriver -name $printDriverName -ErrorAction SilentlyContinue

if ($printDriverExists) 
{
    Add-Printer -Name $name -PortName $portName -DriverName $printDriverName
}
else
{
    Write-Warning "Printer Driver not installed"
}
Restart-Service -Name Spooler -Force