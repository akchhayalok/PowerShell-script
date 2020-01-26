Param(
    [Parameter(Mandatory = $True)]
    [String] $DirectoryToVerify
)

IF([string]::IsNullOrWhiteSpace($DirectoryToVerify)) {            
    "NullOrEmpty"           
} else 
{            
	try
	{
		if (-not (Test-Path -LiteralPath $DirectoryToVerify)) 
		{
			New-Item -Path $DirectoryToVerify -ItemType Directory -ErrorAction Stop | Out-Null #-Force
			"NotExists"
		}
		else 
		{
			"Exists"
		}
	}
	catch
	{
	"CreateError"
	}
} 
