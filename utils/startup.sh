##!/usr/bin/env bash
COMPOSE=`which docker-compose`

$COMPOSE -f /apps/todproof/docker-compose.yml up -d
