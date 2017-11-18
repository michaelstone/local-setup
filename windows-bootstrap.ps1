# Install Ubuntu dist for WSL
# Assumes WSL has already been enabled with windows-enable-wsl.ps1
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile .\Ubuntu.zip -UseBasicParsing
Expand-Archive .\Ubuntu.zip C:\Distros\Ubuntu
& C:\Distros\Ubuntu\ubuntu.exe

# Invoke-WebRequest -Uri https://raw.githubusercontent.com/michaelstone/local-setup/master/bootstrap.sh -OutFile bootstrap.sh

# bash -c "./bootstrap.sh"
