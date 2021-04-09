#!/bin/bash

curl -i "https://api.authy.com/protected/json/sms/${AUTHY_ID}" \
    -H "X-Authy-API-Key: ${AUTHY_API_KEY}"