#function is to Add Environment Path param([Parameter(Mandatory=$true)][string] $source)try{	$Reg = "HKLM:\System\CurrentControlSet\Control\Session Manager\Environment"
	$OldPath = (Get-ItemProperty -Path "$Reg" -Name PATH).Path	if($OldPath.Contains($source))	{		return $true
	}	else	{	[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";" + $source, "Machine")
		return $true
	}
}
catch
{
	return $false
}
