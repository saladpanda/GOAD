#!/bin/bash

# fix for winrm failing due to new openssl
export OPENSSL_CONF=$PWD/openssl.cnf

# providing (create and start the vms)
vagrant up
sleep 60
# provisioning (setup the goad config and install inside the vms)
docker build -t goadansible .

echo -e "\n\nsleeping 5m\n\n"
sleep 5m
docker run -ti --rm --network host -h goadansible -v $(pwd):/goad -w /goad/ansible goadansible ansible-playbook -i ../ad/sevenkingdoms.local/inventory main.yml
