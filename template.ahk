#L:: ; Windows + L
SplashTextOn,,, ALERTA DE PONTO,
Run, "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --new-window "https://prd-pt1.lg.com.br/FrequenciaCoreWeb/home?sessionId=mBq4uvk3yzY8jB5XNVMM7eEbATn9hC3ECpgzje2vaR4on4NhMp4vcjmLl3hbsDnM&application=4"
Run, powershell.exe -windowstyle hidden  -ExecutionPolicy Bypass -Command {COMMAND} -lock
Sleep, 2000
SplashTextOff
return