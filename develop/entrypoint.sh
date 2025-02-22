#!/bin/bash

set -ue

bash -c "$CMD_INITIAL"

for filename in /script/init/* ; do
  bash "$filename"
done

for filename in /script/user-init/* ; do
  su "$USER" -c "bash $filename"
done

sudo apt update
sudo apt upgrade -y

echo "Starting sshd..."
/usr/sbin/sshd -D -e
