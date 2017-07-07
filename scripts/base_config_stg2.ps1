#Set Stage 3 Script to RunOnce
Set-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce" -Name 'Stage_3' -Value "c:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe -noexit a:\base_config_stg3.ps1" -Force

#Installing any additional updates from stage 1#
Write-Host "Patching the patches."
Get-WUInstall -IgnoreReboot -AcceptAll

#Reboot to apply updates#
shutdown /r /c "Installing Additional Updates" /t 20