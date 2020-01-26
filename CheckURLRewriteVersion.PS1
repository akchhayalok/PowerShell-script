Param([string]$serverName)

if ((Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\IIS Extensions\URL Rewrite"))
    {
    #Check URLRewrite Version For 64-bit os and 64-bit application 
       
       (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\IIS Extensions\URL Rewrite").Version
       
    }
    #Check CheckURLRewrite Version For 32-bit Application and 64-bit os
   elseif((Test-Path -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\IIS Extensions\URL Rewrite") )
    {
      (Get-ItemProperty "HKLM:\SOFTWARE\WOW6432Node\Microsoft\IIS Extensions\URL Rewrite").Version

    }  
   else
        {
        
			"0"
        
        }