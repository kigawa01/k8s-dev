#!/bin/bash

set -ue

su "$USER" -c "bash /script/lib/ssh-user-init.sh"

echo "$HOST_ECDSA_KEY" > /etc/ssh/ssh_host_ecdsa_key
echo "$HOST_ED25519_KEY" > /etc/ssh/ssh_host_ed25519_key
echo "$HOST_RSA_KEY" > /etc/ssh/ssh_host_rsa_key

chmod 600 /etc/ssh/*key