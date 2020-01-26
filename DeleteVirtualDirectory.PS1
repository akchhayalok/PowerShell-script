#Function to Delete Virtual directory from IIS

param([string] $VirtualDir , [string] $VirtualDirName)

Import-Module -name WebAdministration
cd IIS:\Sites\
try
{
	$virtualDirChild = Get-ChildItem "IIS:\Sites\Default Web Site\$VirtualDir" #-Recurse | where {$_.Name -like $VirtualDirName} | Remove-Item -Force -Recurse

	foreach($child in $virtualDirChild)
	{
		if($child.Name -eq $VirtualDirName)
		{
			Remove-Item $child -Force -Recurse
			return $true
		}
	}
}
catch
{
	return $false
}