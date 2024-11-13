## Check for Notepad++ (Registry Detection Method)
$Notepad = Get-ChildItem -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall","HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" | Get-ItemProperty | Where-Object {$_.DisplayName -like 'Notepad++*' } | Select-Object -Property DisplayName, DisplayVersion, PSChildName
$Notepad.DisplayVersion
$Notepad.PSChildName

## Create Text File with Notepad++ Registry Detection Method
$FilePath = "C:\Windows\Temp\Notepad++_Detection_Method.txt"
New-Item -Path "$FilePath" -Force
Set-Content -Path "$FilePath" -Value "If([Version](Get-ItemPropertyValue -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$($Notepad.PSChildName)','HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$($Notepad.PSChildName)' -Name DisplayVersion -ea SilentlyContinue) -ge '$($Notepad.DisplayVersion)') {"
Add-Content -Path "$FilePath" -Value "Write-Host `"Installed`""
Add-Content -Path "$FilePath" -Value "Exit 0"
Add-Content -Path "$FilePath" -Value "}"
Add-Content -Path "$FilePath" -Value "else {"
Add-Content -Path "$FilePath" -Value "Exit 1"
Add-Content -Path "$FilePath" -Value "}"
Invoke-Item $FilePath