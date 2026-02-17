#!/bin/bash

adduser --disabled-password --gecos "" "$USER"
echo "${USER}:${PASS}" | chpasswd
gpasswd -a "${USER}" sudo
chown "${USER}:${USER}" /home/${USER}
chown -R "${USER}:${USER}" /home/${USER}/.ssh

chmod 700 /home/${USER}

bash -c "$CMD_USER_CREATED"
