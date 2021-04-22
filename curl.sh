#!/bin/bash

# phone number in E.164 format https://www.twilio.com/docs/glossary/what-e164
PHONE_NUMBER="+15017122661"

# Send verification
curl -X POST https://verify.twilio.com/v2/Services/$VERIFY_SERVICE_SID/Verifications \
    --data-urlencode "To=$PHONE_NUMBER" \
    --data-urlencode "Channel=sms" \
    -u $TWILIO_ACCOUNT_SID:$TWILIO_AUTH_TOKEN

# Check verification
curl -X POST https://verify.twilio.com/v2/Services/$VERIFY_SERVICE_SID/VerificationCheck \
    --data-urlencode "To=$PHONE_NUMBER" \
    --data-urlencode "Code=1234" \
    -u $TWILIO_ACCOUNT_SID:$TWILIO_AUTH_TOKEN
