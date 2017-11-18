Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

Invoke-WebRequest -Uri https://raw.githubusercontent.com/michaelstone/local-setup/master/bootstrap.sh -OutFile bootstrap.sh

bash -c "./bootstrap.sh"
