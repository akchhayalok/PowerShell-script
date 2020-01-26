#Function to validate whether the passed URI is valid or invalid

param([Parameter(Mandatory=$true)][string] $Url)

try
    {
        (Invoke-WebRequest -Uri $Url -UseBasicParsing -DisableKeepAlive).StatusCode
    }
    catch [Net.WebException]
    {
        [int]$_.Exception.Response.StatusCode
    }