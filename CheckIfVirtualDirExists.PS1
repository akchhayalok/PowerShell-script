Param([string]$VirtualDirectory)

   try
   {
           Import-Module WebAdministration
           $Websites = Get-ChildItem IIS:\Sites\Default Web Site
		   $Websites
           foreach($Site in $Websites)
		   {
		   $Site
			   $VDirs = Get-WebVirtualDirectory -Site $Site.name
			   foreach($webvdirectory in $VDirs)
			   {
			   $webvdirectory
				 $vDirectoryName = ($webvdirectory.path -split "/")[-1]
				 If($VirtualDirectory.ToUpper() -eq $vDirectoryName.ToUpper())
				 {
				   return $true
				 }
			   }
		 	}
			return $false
   }
   catch
   {
      return  $false
   }
