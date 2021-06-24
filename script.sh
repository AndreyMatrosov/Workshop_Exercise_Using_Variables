#!/usr/bin/env/ bash
#adding the fingerprint from a remote serve to a local machine
ssh-keyscan -H 192.168.1.11 >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.1.21 >> ~/.ssh/known_hosts
#ssh-keyscan -H 192.168.1.22 >> ~/.ssh/known_hosts
#ssh-keyscan -H 192.168.1.23 >> ~/.ssh/known_hosts
# generate ssh key (ecdsa)
ssh-keygen -t rsa -b 4096
# copying the public key
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@192.168.1.21
#ssh-copy-id -i ~/.ssh/id_psa.pub vagrant@192.168.1.22
#ssh-copy-id -i ~/.ssh/id_psa.pub vagrant@192.168.1.23
#test the new key
ssh -i ~/.ssh/id_rsa.pub vagrant@192.168.1.21