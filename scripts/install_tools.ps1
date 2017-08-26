Write-Host "Installing VMware Tools"
$tools = Start-Process msiexec.exe -Wait -ArgumentList '/I C:\Windows\Temp\VMwareTools64.msi /qn REBOOT=R'

if ($tools.ExitCode -eq 0) {
    Write-Host "Tools complete"
} elseif ($tools.ExitCode -eq 3010) {
    Write-Host "Tools complete. Can I haz reboot?"
} else {
    Write-Host "You have failed me: ExitCode=$($tools.ExitCode), Log=C:\Windows\Temp\vmware_tools.log"
    exit $tools.ExitCode
}