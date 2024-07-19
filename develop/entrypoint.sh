#!/bin/bash

set -ue

for filename in /script/init/* ; do
  bash "$filename"
done

echo "Starting sshd..."
/usr/sbin/sshd -D -e
