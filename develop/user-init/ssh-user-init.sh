#!/bin/bash

set -ue

echo "Changing to home directory..."
cd

echo "Checking if ./.ssh directory exists..."
if [ ! -d ./.ssh ]; then
    mkdir "./.ssh" || { echo "Error creating directory './.ssh'"; exit 1; }
fi
chmod 700 ./.ssh
echo "Checking if PUBKEY variable is set..."
if [ -z "${PUBKEY:-}" ]; then
    echo "PUBKEY is unset or set to the empty string"
    exit 1
else
    echo "Adding PUBKEY to authorized_keys..."
    echo "${PUBKEY}" >> ./.ssh/authorized_keys || { echo "Error appending to authorized_keys"; exit 1; }
    chmod 600 ./.ssh/authorized_keys
fi
