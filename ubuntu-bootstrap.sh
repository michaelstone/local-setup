#!/bin/bash

sudo apt update
sudo apt install software-properties-common

# Install old git from main repository - latest version will be installed in ansible script
sudo apt install git

# Clone setup repository with ansible scripts
cd ~
git clone https://github.com/michaelstone/local-setup.git

# Install ansible
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible

# Run ansible
cd local-setup
ansible-playbook master.yml -K -i HOSTS 
