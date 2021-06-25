#!/usr/bin/env bash
#install ansible
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible
#install sshpass
sudo apt install -y sshpass
#install additional utilities
sudo apt install -y tree