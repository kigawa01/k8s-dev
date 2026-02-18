#!/bin/bash

set -ue

DAEMON_PIDS=()

register_daemon() {
  DAEMON_PIDS+=($1)
}

graceful_shutdown() {
  echo "Received SIGTERM, shutting down gracefully..."
  for pid in "${DAEMON_PIDS[@]:-}"; do
    if [ -n "$pid" ] && kill -0 "$pid" 2>/dev/null; then
      kill -TERM "$pid" 2>/dev/null || true
    fi
  done
  for pid in "${DAEMON_PIDS[@]:-}"; do
    if [ -n "$pid" ] && kill -0 "$pid" 2>/dev/null; then
      wait "$pid" 2>/dev/null || true
    fi
  done
  exit 0
}

trap graceful_shutdown TERM INT

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


echo "Starting sshd..."
/usr/sbin/sshd -D -e &
SSHD_PID=$!
register_daemon "$SSHD_PID"
wait $SSHD_PID
