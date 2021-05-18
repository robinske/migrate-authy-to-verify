// Download the helper library from https://www.twilio.com/docs/node/install
// Your Account Sid and Auth Token from twilio.com/console
// and set the environment variables. See http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require("twilio")(accountSid, authToken);

// Create a Verify Service in the Console: https://www.twilio.com/console/verify/services
const verifyServiceSid = process.env.VERIFY_SERVICE_SID;

// Use this instead of the Authy ID.
// Must be in E.164 format: https://www.twilio.com/docs/glossary/what-e164
const toNumber = "+15017122661";

function send() {
  client.verify
    .services(verifyServiceSid)
    .verifications.create({ to: toNumber, channel: "sms" })
    .then((verification) => console.log(verification.sid));
}

function check(token) {
  client.verify
    .services(verifyServiceSid)
    .verificationChecks.create({ to: toNumber, code: token })
    .then((verification_check) => console.log(verification_check.status));
}
