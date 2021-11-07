#!/bin/bash

set -e

# vars

## define default ssh options for ssh connections
__SSH_OPTS="\
-o PasswordAuthentication=yes \
-o PubkeyAuthentication=no \
-o ForwardAgent=no \
-o ForwardX11=no \
-o GSSAPIAuthentication=no \
-o HostKeyAlgorithms=+ssh-rsa \
-o PubkeyAcceptedKeyTypes=+ssh-rsa \
-o StrictHostKeyChecking=no \
-o TCPKeepAlive=yes \
-o ControlMaster=auto \
-o ControlPath=~/.ssh/control-%h-%p-%r \
-o ControlPersist=1m \
"

# functions
function fn_report (){
  [[ -z ${2} ]] && exit 1
  case ${1} in
    "DBG")
      echo "DBG: ${2}"
  esac
}

# exec

# debug
fn_report DBG "ssh options: ${__SSH_OPTS}"

# shellcheck disable=SC2086
ssh ${__SSH_OPTS} 192.168.105.254


# check connection

# copy files

# import ssh-keys for users

# cleanup

# report
