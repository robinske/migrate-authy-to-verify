#!/bin/bash

# Send verification
curl -i "https://api.authy.com/protected/json/sms/${AUTHY_ID}" \
    -H "X-Authy-API-Key: ${AUTHY_API_KEY}"

# Check verification
curl -i "https://api.authy.com/protected/json/verify/${TOKEN}/${AUTHY_ID}" \
    -H "X-Authy-API-Key: ${AUTHY_API_KEY}"