# Download the helper library from https://github.com/twilio/authy-ruby
require 'authy'

# Your API key from twilio.com/console/authy/applications
# DANGER! This is insecure. See http://twil.io/secure
Authy.api_key = ENV['AUTHY_API_KEY']
Authy.api_uri = 'https://api.authy.com'

verification = Authy::API.request_sms(:id => ENV['AUTHY_ID'])

puts verification.message