$current_script_path = $MyInvocation.MyCommand.Path
$current_script_folder = Split-Path -Path $current_script_path -Parent
$appdata_path = Resolve-Path -Path $env:APPDATA

# Install autohotkey
Invoke-WebRequest -Uri "https://www.autohotkey.com/download/ahk-install.exe" -OutFile "$current_script_folder/ahk-install.exe"
& "$current_script_folder/ahk-install.exe"

[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')
[System.Windows.Forms.MessageBox]::Show('Click OK AFTER installing auto-hotkey (installer loading)','WARNING', 0, 16)

# generate autohotkey script from the template (correct filepahts)
$file_path = "$current_script_folder/template.ahk"
$outfile_path = "$current_script_folder/ponto.ahk"
$content = Get-Content -Path $file_path
$updated_content = $content -replace "{COMMAND}", "`"$current_script_folder/message.ps1`""
$updated_content | Set-Content -Path $outfile_path

# Run the autohotkey script
&"$appdata_path\Microsoft\Windows\Start Menu\Programs\Startup\autohotkey_setup.lnk"

# Create a shortcut to always run the ahk on startup
New-Item -Force -ItemType SymbolicLink -Path "$appdata_path\Microsoft\Windows\Start Menu\Programs\Startup\autohotkey_setup.lnk" -Target "$current_script_folder/ponto.ahk"
# Create a task to run the message.ps1 on login
schtasks.exe /Create /tn "Run PowerShell Script on Login" /tr "powershell.exe -NoProfile -ExecutionPolicy Bypass -File $current_script_folder/message.ps1 -open" /sc onlogon
