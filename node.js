// Download the helper library from https://github.com/evilpacket/node-authy

// Your API key from twilio.com/console/authy/applications
// DANGER! This is insecure. See http://twil.io/secure
var authy = require("authy")(process.env.AUTHY_API_KEY);

authy.request_sms(process.env.AUTHY_ID, function (err, res) {
  console.log(res.message);
});
