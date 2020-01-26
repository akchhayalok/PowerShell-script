param ( [string]$SourceExe, [string]$DestinationPath, [string]$iconLocation , [string]$startsin, [string]$arguments)

	$WshShell = New-Object -comObject WScript.Shell
	$Shortcut = $WshShell.CreateShortcut($DestinationPath)
	$Shortcut.TargetPath = $SourceExe
	$Shortcut.Arguments = $arguments
	$Shortcut.IconLocation = $iconLocation
	$Shortcut.WorkingDirectory = $startsin
	$Shortcut.Save()
	$true
