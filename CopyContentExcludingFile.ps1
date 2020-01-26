#Script to copy content, excluding some of the some files
param(
[string]$sourcePath,
[string]$destinationPath,
[string]$excludeItem
)
try {

if(Test-path -path $destinationPath)
	{
	Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse -Force -Verbose
	"CopySuccess"
	}
	else
	{
		New-Item -path $destinationPath -itemType Directory
		Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse -Force -Verbose
	    "CopySuccess"

	}

}
catch
{
 "Copy error"
}