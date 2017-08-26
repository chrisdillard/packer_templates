#Log all updates installed#
New-Item -Type Directory "C:\build"
Get-WUHistory | Export-Csv "C:\build\Windows_Update_Log.csv"

#Disable autologon#
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AutoAdminLogon" -Value "0"

#Disable Windows Firewall#
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

#Enable WinRM#
Enable-WSManCredSSP -Force -Role Server
set-wsmanquickconfig -force
sc.exe config WinRM start=auto

#Allow WinRM unencrypted#
Enable-PSRemoting -Force -SkipNetworkProfileCheck
winrm set winrm/config/client/auth '@{Basic="true"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'
winrm set winrm/config '@{MaxTimeoutms="1800000"}'
winrm set winrm/config/winrs '@{MaxMemoryPerShellMB="2048"}'
winrm set winrm/config/listener?Address=*+Transport=HTTP '@{Port="5985"}'

Write-Host "Build Complete."