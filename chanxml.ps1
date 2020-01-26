$xml=New-Object XML
$xml.Load("C:\users\Akchhay.Alok\Desktop\test.xml")
$node = $xml.SelectNodes("/office/staff")
foreach($item in $node)
{
$node.SetAttribute("branch", "Mumbai")
}
$xml.Save("C:\users\Akchhay.Alok\Desktop\test.xml")