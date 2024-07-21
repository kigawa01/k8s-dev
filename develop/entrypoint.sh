#!/bin/bash

set -ue

bash -c "$CMD_INITIAL"

for filename in /script/init/* ; do
  bash "$filename"
done

echo "Starting sshd..."
/usr/sbin/sshd -D -e
