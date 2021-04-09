<?php

// Download the helper library from https://github.com/twilio/authy-php
// Update the path below to your autoload.php,
// see https://getcomposer.org/doc/01-basic-usage.md
require_once '/path/to/vendor/autoload.php';

// Find your Account Sid and Auth Token at twilio.com/console
// and set the environment variables. See http://twil.io/secure
$sid = getenv("TWILIO_ACCOUNT_SID");
$token = getenv("TWILIO_AUTH_TOKEN");
$twilio = new Client($sid, $token);

# Create a Verify Service in the Console: https://www.twilio.com/console/verify/services
$verify_service_sid = getenv("VERIFY_SERVICE_SID");

# Use this instead of the Authy ID.
# Must be in E.164 format: https://www.twilio.com/docs/glossary/what-e164
$to_number = "+15017122661";


function send() {
    $verification = $twilio->verify->v2->services($verify_service_sid)
                                   ->verifications
                                   ->create($to_number, "sms");

    if ($verification->status == "pending") {
        print($verification->sid);
    }
}

function check($token) {
    $verification_check = $twilio->verify->v2->services("VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
                                         ->verificationChecks
                                         ->create($token,
                                                  ["to" => $to_number]
                                         );
}
