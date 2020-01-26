#Function to execute the Shell script
#Both $pShellcommand and $pShellParams are mandatory

param([Parameter(Mandatory=$true)][string]$pShellcommand , [Parameter(Mandatory=$true)][string]$pShellParams)

# Load assemblies
        [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.PowerShell.Management") | Out-Null
		try
		{
			$proc = Start-Process -FilePath $pShellcommand -ArgumentList $pShellParams -WindowStyle Hidden

			$timeOuted = $null

			$proc | Wait-Process -Timeout 3000 -ErrorAction SilentlyContinue -ErrorVariable timeouted

			if ($timeouted)
			{
				# terminate the process
				$proc | kill

				return $proc.ExitCode
			}
			elseif ($proc.ExitCode -ne 0)
			{
				# update internal error counter
				return $proc.ExitCode
			}

			retrun $proc.ExitCode
		}
		catch
		{
			return "-1"
		}

