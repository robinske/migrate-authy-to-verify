# Download the helper library from https://github.com/twilio/authy-python
from authy.api import AuthyApiClient
import os

authy_id = os.environ["AUTHY_ID"]
api_key = os.environ["AUTHY_API_KEY"]
client = AuthyApiClient(api_key)

def send():
    verification = client.users.request_sms(authy_id)

    if verification.ok():
        print(verification.content)
    else:
        print(verification.errors())


def check(token):
    verification = authy_api.tokens.verify(authy_id, token=token)
    print(verification.ok())