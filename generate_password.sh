#!/bin/bash
set -e

PASS=$(openssl rand -hex 4)

# Save to local file (used by static site / nginx)
echo $PASS > roles/webserver/files/password.txt

# Update AWS Secrets Manager
aws secretsmanager put-secret-value \
  --secret-id wandernest-login-secret \
  --secret-string "{\"username\":\"admin\",\"password\":\"$PASS\"}" \
  --region ap-south-1

echo "=================================="
echo "TEMP PASSWORD: $PASS"
echo "Password updated in Secrets Manager"
echo "=================================="