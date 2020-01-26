[xml]$doc = get-content -Path("C:\Users\Akchhay.Alok\Desktop\InstallSettings.xml")
$email = $doc.SelectSingleNode("//EmailSettings")
$staff = $email.SmtpHost
Write-Output $staff