#Install Chocolatey#
#iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
#choco feature enable --name allowGlobalConfirmation
#choco feature disable --name checksumFiles

#Install PSWindowsUpdate Module#
#choco install pswindowsupdate
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module -Name PSWindowsUpdate -RequiredVersion 1.5.2.6 -Force
Import-Module PSWindowsUpdate

#Set Stage 2 Script to RunOnce
Set-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce" -Name 'Stage_2' -Value "c:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe -noexit a:\base_config_stg2.ps1" -Force

#Installing Windows Updates#
Write-Host "Installing Windows updates. This is going to take forever."
Get-WUInstall -IgnoreReboot -AcceptAll

#Reboot to apply updates#
shutdown /r /c "Installing Updates" /t 20