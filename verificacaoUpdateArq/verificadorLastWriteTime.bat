@ ECHO OFF
color 09
PUSHD "C:\Caminho\Do\Arquivo\Aqui"
PowerShell.exe -Command ".\\verificadorLastWriteTime.ps1" /Y /C
POPD
