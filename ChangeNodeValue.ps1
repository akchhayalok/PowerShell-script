$filePathToTask = "C:\temp\Task.xml"
$xml = New-Object XML
$xml.Load($filePathToTask)
$element =  $xml.SelectSingleNode("//Arguments")
$element.InnerText = "New Text"
$xml.Save($filePathToTask)