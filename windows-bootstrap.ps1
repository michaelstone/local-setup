# Install Ubuntu dist for WSL
# Assumes WSL has already been enabled with windows-enable-wsl.ps1
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile .\Ubuntu.zip -UseBasicParsing
Expand-Archive .\Ubuntu.zip C:\Distros\Ubuntu
& C:\Distros\Ubuntu\ubuntu.exe

# Above command leaves the terminal at the WSL prompt
exit 0

# Run the ansible bootstrap
# Note: there's a current issue with Bitdefender firewall blocking internet access from ubuntu on WSL
# Fix here - https://github.com/Microsoft/WSL/issues/2360
Invoke-WebRequest -Uri https://raw.githubusercontent.com/michaelstone/local-setup/master/bootstrap.sh -OutFile bootstrap.sh
bash -c "./bootstrap.sh"
