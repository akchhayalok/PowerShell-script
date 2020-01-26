Param(
    [String] $ConfigFilePath,
	[String] $ConName
)

if([System.IO.File]::Exists($ConfigFilePath))
{
	$doc = (Get-Content $ConfigFilePath) -as [Xml]
	$root = $doc.get_DocumentElement()
		
 	foreach($cs in $root.connectionStrings.add)
    {
        if($cs.name -eq $ConName)
        {
			$cs.connectionString
			break
        }
    }
}
