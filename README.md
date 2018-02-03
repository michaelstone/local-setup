# Usage [complete WIP]

## Ubuntu

```bash
wget  https://raw.githubusercontent.com/michaelstone/local-setup/master/ubuntu-bootstrap.sh && chmod 744 ubuntu-bootstrap.sh && ./ubuntu-bootstrap.sh
```

## Windows

1. Enable WSL
```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

2. Run provisioning script
```powershell
Invoke-WebRequest -Uri https://raw.githubusercontent.com/michaelstone/local-setup/master/windows-bootstrap.ps1 -OutFile windows-bootstrap.ps1; Start-Process powershell -Verb runAs "-NoExit -ExecutionPolicy Bypass -Command cd $pwd; & .\windows-bootstrap.ps1"
```
#. Run ansible independently
```bash
ansible-playbook windows_master.yml -i HOSTS_WINDOWS.yml --vault-id @prompt
```

Notes:
- Had to separate out ubuntu and windows master files due to create two localhost hosts
- Had to create a local administrator account to run the winrm session against
    + https://support.microsoft.com/en-gb/help/4026923/windows-create-a-local-user-or-administrator-account-in-windows-10


# Things to add

- Spotify

https://www.spotify.com/uk/download/linux/ 


- Bluetooth

Potential pairing fix
https://askubuntu.com/questions/689281/pulseaudio-can-not-load-bluetooth-module-15-10-16-04-16-10#689297
https://unix.stackexchange.com/questions/159881/how-to-pair-bose-soundlink-bluetooth-using-pulseaudio-in-linux-mint-debian-edi


# Fix

- nvm 
  + fix creates directory using ansible_user_id
  + split task to create alias for default node version
  + fix env variable for accessing nvm
  + ** hard coded node version which breaks every time it's released
- npm 
  + install latest version of npm instead of node bundled
- node 
  + dynamically get the latest version instead of using default var


# Next tasks

- [DONE] Add winrm setup to windows-bootstrap to allow windows modules to be run
  + http://docs.ansible.com/ansible/latest/intro_windows.html
- [DONE] Encrypt windows user/pass with ansible_vault
- Update windows bootstrap to run ansible
- Update windows playbook to run role to also install/update ubuntu 

# Troubleshooting

- Npm install fails, try this:
  + https://github.com/ansible/ansible-modules-extras/issues/2128
  + node isn't available when run as sudo - sudo doesn't load ~/profile
  + create symlink to node binary in nvm dir before running npm tasks
  + What worked: I was running ansible-playbook as sudo, left that off and set individual tasks as sudo using become and passing in -K
- Error running ansible: Could not get lock /var/lib/dpkg/lock
  + Fix 1: look for other apt or apt-get processes and kill them
  + Fix 2: delete the lock files
    + sudo rm /var/lib/dpkg/lock
    + sudo dpkg --configure -a
