# Download the helper library from https://www.twilio.com/docs/python/install
from twilio.rest import Client
from twilio.base.exceptions import TwilioRestException
import os

# Find these credentials in the Twilio Console: https://www.twilio.com/console
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

# Create a Verify Service in the Console: https://www.twilio.com/console/verify/services
verify_service_sid = os.environ['VERIFY_SERVICE_SID']

# Use this instead of the Authy ID.
# Must be in E.164 format: https://www.twilio.com/docs/glossary/what-e164
to_number = '+15017122661'

def send():
    try:
        verification = client.verify \
            .services(verify_service_sid) \
            .verifications \
            .create(to=to_number, channel='sms')

        print(verification.sid)
    except TwilioRestException as e:
        print(e)


def check(token):
    try:
        verification_check = client.verify \
            .services(verify_service_sid) \
            .verification_checks \
            .create(to=to_number, code=token)

        if verification_check.status == "approved":
            # valid token
        else:
            # invalid token
    except TwilioRestException as e:
        print(e)