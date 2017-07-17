#!/bin/bash

# Script variables
PASSWD_GEN_CMD="openssl rand -base64 16"

touch .rnd
PWD=`pwd`
export RANDFILE="${PWD}/.rnd"

# Generate random passwords for MySQL accounts
MYSQL_ROOT_PASSWORD=`${PASSWD_GEN_CMD}`
MYSQL_OMEKA_PASSWORD=`${PASSWD_GEN_CMD}`

unset RANDFILE

# Install requisite Ansible Galaxy roles
./setup_requirements.sh

# Run the default playbook
ansible-playbook ./site.yml --extra-vars "mysql_root_password=$MYSQL_ROOT_PASSWORD omeka_password=$MYSQL_OMEKA_PASSWORD"
