#!/bin/bash

adduser --disabled-password --gecos "" "$USER"
echo "${USER}:${PASS}" | chpasswd
gpasswd -a kigawa sudo

bash -c "$CMD_USER_CREATED"
