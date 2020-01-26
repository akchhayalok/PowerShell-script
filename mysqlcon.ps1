[void][System.Reflection.Assembly]::LoadFrom("C:\Program Files (x86)\MySQL\MySQL Connector Net 8.0.18\Assemblies\v4.5.2\MySql.Data.dll")
$myconnection = New-Object MySql.Data.MySqlClient.MySqlConnection
$myconnection.ConnectionString = "server=172.28.84.33;uid=webuser;password=Check4SW;database=finplus194;pooling=false"
$myconnection.Open()
$mycommand = New-Object MySql.Data.MySqlClient.MySqlCommand
$mycommand.Connection = $myconnection
$mycommand.CommandText = "SHOW TABLES"
$myreader = $mycommand.ExecuteReader()
while($myreader.Read()){ $myreader.GetString(0) }
$myconnection.Close()