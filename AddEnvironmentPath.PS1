﻿#function is to Add Environment Path 
	$OldPath = (Get-ItemProperty -Path "$Reg" -Name PATH).Path
	}
		return $true
	}
}
catch
{
	return $false
}