#!/bin/bash

sudo apt update
sudo apt install software-properties-common
sudo apt install git
cd ~
git clone git@github.com:michaelstone/local-setup.git
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
cd local-setup
ansible-playbook ubuntu_master.yml -K -i HOSTS 
