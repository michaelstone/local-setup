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
- npm 
  + install latest version of npm instead of node bundled
- node 
  + dynamically get the latest version instead of using default var


# Next tasks

- Remove junk from tasks that was needed because I was running whole thing as sudo

# Troubleshooting

- Npm install fails, try this:
  + https://github.com/ansible/ansible-modules-extras/issues/2128
  + node isn't available when run as sudo - sudo doesn't load ~/profile
  + create symlink to node binary in nvm dir before running npm tasks
  + What worked: I was running ansible-playbook as sudo, left that off and set individual tasks as sudo using become and passing in -K
- Could not get lock /var/lib/dpkg/lock
  + something causing 
