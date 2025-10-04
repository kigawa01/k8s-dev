#!/bin/bash

adduser --disabled-password --gecos "" "$USER"
echo "${USER}:${PASS}" | chpasswd
gpasswd -a "${USER}" sudo
chown "${USER}:${USER}" /home/${USER}/
chown "${USER}:${USER}" /home/${USER}/*
chown -R "${USER}:${USER}" /home/${USER}/.ssh

bash -c "$CMD_USER_CREATED"
