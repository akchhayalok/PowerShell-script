Param(
    [String] $SrcConfigFilePath,
	[String] $DestConfigFilePath,
	[String] $ConName
)

try
{
	if(([System.IO.File]::Exists($SrcConfigFilePath)) -and ([System.IO.File]::Exists($DestConfigFilePath)))
	{
		$doc = (Get-Content $SrcConfigFilePath) -as [Xml]
		$root = $doc.get_DocumentElement()
		[String] $srcconnectionstring = ""
 		foreach($cs in $root.connectionStrings.add)
        {
           if($cs.name -eq $ConName)
           {
				$srcconnectionstring = $root.connectionStrings.add.connectionString
				break
           }
        }

		$docDest = (Get-Content $DestConfigFilePath) -as [Xml]
		$rootDest = $docDest.get_DocumentElement()
		$csUpdated = $false;
		if($srcconnectionstring)
		{
			foreach($cs in $rootDest.connectionStrings.add)
			{
			   if($cs.name -eq $ConName)
			   {
					$cs.connectionString = $srcconnectionstring
					$csUpdated = $true
					break
			   }
			}

			if($csUpdated)
			{
				$docDest.Save($DestConfigFilePath) 
			}
			else
			{
				"ConStringUpdateError"
			}
		}
		else
		{
			"ConStringUpdateError"
		}
	}
	else
	{
		"ConfigNotExists"
	}
}
catch
{
	"ConStringUpdateError"
}