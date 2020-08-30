#!/bin/bash
cd `dirname $0`

ansible-playbook -f 3 --ssh-common-args="$ANSIBLE_SSH_COMMON_ARGS" -i "$@" yml_books/ssh.yml yml_books/clean.yml

