#!/usr/bin/bash
export TAG=$1
docker compose -f docker-compose.yaml up --detach
echo "success"

