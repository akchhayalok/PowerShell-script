$portName = "TS Port02"
$printDriverName = "HP universal printer driver pcl5"


$portExists = Get-Printerport -Name $portname -ErrorAction SilentlyContinue

if (-not $portExists) {
  Add-PrinterPort -name $portName 
}

$printDriverExists = Get-PrinterDriver -name $printDriverName -ErrorAction SilentlyContinue

if ($printDriverExists) {
    Add-Printer -Name "Azure_Dummy" -PortName $portName -DriverName $printDriverName
}else{
    Write-Warning "Printer Driver not installed"
}