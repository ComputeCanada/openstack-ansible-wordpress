#!/bin/bash

# Install requisite Ansible Galaxy roles
ansible-galaxy install -r ./requirements.yml -p ./roles

exit 0
