Param(
    [String] $FileName,
    [String] $TokenId,
	[String] $AppId
)

try
{
	$myArgs = '-a ' + $a + ' -b ' + $b + ' -c ' + $c 

	$psi = New-object System.Diagnostics.ProcessStartInfo 

	$psi.CreateNoWindow = $true 
	$psi.UseShellExecute = $false 
	$psi.FileName = $FileName
	$psi.Arguments = "-u -wait " + $TokenId + " TASK " + $AppId

	$process = New-Object System.Diagnostics.Process 
	$process.StartInfo = $psi 
	$process.EnableRaisingEvents = $true
	[void]$process.Start() 
	$output = $process.StandardOutput.ReadToEnd() 
	$process.WaitForExit() 
	$output 
}
catch
{
	"ProcessExecError"
}