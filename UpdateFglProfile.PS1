Param(
[String]$ConnectionString,
[String]$ProfileFile,
[String]$UserProfile,
[String]$PassProfile,
[String]$PrivateKeyFile
)

try
{
    [bool]$wroteLines = $false
    if (![System.IO.File]::Exists($ProfileFile))
    {
        "FileNotExists"
    }
    else
    {
        $SqlConnection = new-object System.Data.SqlClient.SqlConnection
        $SqlConnection.ConnectionString = $ConnectionString
        $Database = $SqlConnection.Database
        $NewContent = [System.IO.File]::ReadAllLines($ProfileFile)
        if($NewContent.lenth -ge 0)
        {
            $NewContent += " "
        }
        $NewContent += "# Encrypted Catalog Information "
        if(!$NewContent -Contains "spi.hash.seed")
        {
            $NewContent += 'spi.hash.seed = ""'
            $wroteLines = $true
        }

        # Add the spi.hash.suffix to the fglprofile if it does not exist.
        if (!$NewContent -Contains "spi.hash.suffix")
        {
            $NewContent += 'spi.hash.suffix = "@Ki2"'
            $wroteLines = $true
        }
        # Add the catalog database entry and the encrypted information/keys to the fglprofile if they do not exist.
        if (!$NewContent -Contains "spi.catalog.db_name")
        {
            $NewContent += 'spi.catalog.db_name = "' + $Database + '"'
            $wroteLines = $true
        }
        if (!$NewContent -Contains "spi.catalog.privatekey")
        {
            $NewContent += 'spi.catalog.privatekey = "' + $PrivateKeyFile.Replace('\', '/') + '"'
            $wroteLines = $true
        }
        if (!$NewContent -Contains "spi.catalog.username.encrypted")
        {
            $userValue = $null
            $encryptedUserLines = [System.IO.File]::ReadAllLines($UserProfile)
            if ($encryptedUserLines.Length -ge 0)
            {
               # Need to ignore the lines in the user fle that have 'BASE64' in them.
               $filteredUserLines = $encryptedUserLines -notcontains "BASE64"
               $userValue = [string]::Join("", $filteredUserLines) 
               $NewContent += 'spi.catalog.username.encrypted = "' + $userValue + '"'
               $wroteLines = $true
            }
        }
        if (!$NewContent -Contains "spi.catalog.password.encrypted")
        {
            $passvalue = $null
            $encryptedPassLines = [System.IO.File]::ReadAllLines($PassProfile)
            if ($encryptedPassLines.Length -ge 0)
            {
                # Need to ignore the lines in the user fle that have 'BASE64' in them.
                $filteredPassLines = $encryptedPassLines -notcontains "BASE64"
                $passvalue =[string]::Join("", $filteredPassLines) 
                $NewContent += 'spi.catalog.password.encrypted = "' + $passvalue + '"'
                $wroteLines = $true
            }
        }
        # write to fglprofile file if entries were added
        if ($wroteLines)
        {
            if (File.Exists($ProfileFile))
            {
                $dt = [datetime](Get-ItemProperty -Path $ProfileFile -Name LastWriteTime).lastwritetime
                $destFileName = $ProfileFile + "_" + $dt.ToString("MM_dd_yyyy-hh_mm_ss-tt", [cultureinfo]::InvariantCulture)
                File.Copy($ProfileFile, $destFileName, $true)
            }

            #Write content of $NewContent variable back to file
            [System.IO.File]::WriteAllLines($ProfileFile, $NewContent)
        }
        else
        {
            "ProfileNotModified"
        }
    }
}
catch
{
    "ProfileUpdateError"
}


