call winrm set winrm/config/service/auth @{Basic="false"}
call winrm set winrm/config/service @{AllowUnencrypted="false"}

shutdown /s /c "End Packer Run" /t 30

