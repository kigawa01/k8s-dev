#!/bin/bash

set -ue

su "$USER" -c "bash /script/lib/ssh-user-init.sh"

chmod 600 /etc/ssh/*key