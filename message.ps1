 param (
    [switch]$lock = $false ,
    [switch]$open = $false
 )

# Create a new SpVoice objects
$voice = New-Object -ComObject Sapi.spvoice
# Set the speed - positive numbers are faster, negative numbers, slower
$voice.rate = 5
# Say something

if ($open)
{
  Start-Process "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" "--new-window https://prd-pt1.lg.com.br/FrequenciaCoreWeb/home?sessionId=mBq4uvk3yzY8jB5XNVMM7eEbATn9hC3ECpgzje2vaR4on4NhMp4vcjmLl3hbsDnM&application=4"
}
$voice.speak("Bate o ponto seu esquecido")
$voice.speak("Bate o ponto seu esquecido")
$voice.speak("AAAAAAAAAAAAAAAA")

if ($lock)
{
  [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')
    $continue = [System.Windows.Forms.MessageBox]::Show('Bateu o ponto? Trancar a tela?','WARNING', 4, 16)
    if ($continue -eq 'Yes') {
      regedit.exe /S C:\Users\Pedro\Documents\AutoHotkey\EnableLockWorksation.reg
      Start-Sleep 2
      rundll32.exe user32.dll,LockWorkStation
      regedit.exe /S C:\Users\Pedro\Documents\AutoHotkey\DisableLockWorksation.reg
    }

}else{
  [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')
  $continue = [System.Windows.Forms.MessageBox]::Show('Bateu o ponto?','WARNING', 0, 16)
}
