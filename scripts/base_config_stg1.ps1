#Install Chocolatey#
#iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
#choco feature enable --name allowGlobalConfirmation
#choco feature disable --name checksumFiles

#Set static IP if needed#
#New-NetIPAddress -InterfaceIndex 1 -IPAddress 10.202.138.99 -PrefixLength 26 -DefaultGateway 10.202.138.126
#Set-DnsClientServerAddress -InterfaceIndex 1 -ServerAddresses 10.202.133.1, 10.204.133.1

#Set timezone#
#Set-TimeZone -Name "Central Standard Time"

#Install NuGet#
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

#Install PSWindowsUpdate Module#
#choco install pswindowsupdate
Install-Module -Name PSWindowsUpdate -RequiredVersion 1.6.1.1 -Force
Import-Module PSWindowsUpdate

#Install Chef-Client#
. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -version 13.3.42

#Set Stage 2 Script to RunOnce#
Set-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce" -Name 'Stage_2' -Value "c:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe -noexit a:\base_config_stg2.ps1" -Force

#Install .net 3.5#
Dism /online /enable-feature /featurename:NetFx3 /All /Source:D:\sources\sxs /LimitAccess

#Installing Windows Updates#
Write-Host "Installing Windows updates. This is going to take forever."
Get-WUInstall -IgnoreReboot -AcceptAll

#Reboot to apply updates#
shutdown /r /c "Installing Updates" /t 20