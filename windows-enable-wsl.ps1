Invoke-WebRequest -Uri https://raw.githubusercontent.com/michaelstone/local-setup/master/windows-enable-wsl.ps1 -OutFile windows-enable-wsl.ps1; Start-Process powershell -Verb runAs "-NoExit -ExecutionPolicy Bypass -Command
 cd $pwd; & .\windows-enable-wsl.ps1"
