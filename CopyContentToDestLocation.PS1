Param(
    [String] $SourceDir,
    [String] $DestinationDir
)

try
{
    if(Test-path -path $DestinationDir)
	{
	Copy-Item -Path $SourceDir -Destination $DestinationDir -Recurse -Force -Verbose
	"CopySuccess"
	}
	else
	{
		New-Item -path $DestinationDir -itemType Directory
		Copy-Item -Path $SourceDir -Destination $DestinationDir -Recurse -Force -Verbose
	    "CopySuccess"

	}
}
catch
{
	"CopyError"
}