Param(

    [String] $FilePathToRename,
	[String] $FileName
)

try
{
	if(test-Path -path $FilePathToRename)
	{
		 Rename-Item -Path $FilePathToRename -NewName $FileName
		 "RenameSuccess"
	}
	else
	{
		"FileExists"
	}
}
catch
{
	"RenameError"
}