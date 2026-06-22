#!/bin/bash

PASS=$(openssl rand -hex 4)

echo $PASS > roles/webserver/files/password.txt

echo "=================================="
echo "TEMP PASSWORD: $PASS"
echo "=================================="
