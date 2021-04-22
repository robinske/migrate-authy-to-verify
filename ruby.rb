# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Your Account Sid and Auth Token from twilio.com/console
# and set the environment variables. See http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Create a Verify Service in the Console: https://www.twilio.com/console/verify/services
verify_service_sid = ENV['VERIFY_SERVICE_SID']

# Use this instead of the Authy ID.
# Must be in E.164 format: https://www.twilio.com/docs/glossary/what-e164
to_number = '+15017122661'


def send
    verification = @client.verify
        .services(verify_service_sid)
        .verifications
        .create(to: to_number, channel: 'sms')

    puts verification.sid
end


def check(token)
    verification_check = @client.verify
        .services(verify_service_sid)
        .verification_checks
        .create(to: to_number, code: token)

    if verification_check.status == "approved"
        # correct token
    else
        # incorrect token
    end
end
