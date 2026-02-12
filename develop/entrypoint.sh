#!/bin/bash

set -ue

bash -c "$CMD_INITIAL"

for filename in /script/init/* ; do
  bash "$filename"
done

if [ ! -z "${CMD_USER_PREINIT:-}" ]; then
su "$USER" -c "${CMD_USER_PREINIT}"
fi
for filename in /script/user-init/* ; do
  su "$USER" -c "bash $filename"
done

sudo apt update
sudo apt upgrade -y

if [ ! -f /etc/ssh/sshd_config ]; then
  echo '' > /etc/ssh/sshd_config
fi

echo "Starting sshd..."
/usr/sbin/sshd -D -e
