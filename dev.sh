#!/bin/sh

# create log files
mkdir -p data/logs
[ -e "data/logs/access.log" ] || touch "data/logs/access.log"
[ -e "data/logs/error.log" ] || touch "data/logs/error.log"

cd docker && docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d
