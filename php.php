<?php

// Download the helper library from https://github.com/twilio/authy-php
// Update the path below to your autoload.php,
// see https://getcomposer.org/doc/01-basic-usage.md
require_once '/path/to/vendor/autoload.php';

$authy_api = new Authy\AuthyApi(getenv('AUTHY_API_KEY'));

$sms = $authy_api->requestSms(getenv('AUTHY_ID'));

if ($sms->ok()) {
    printf($sms->message());
} else {
    print_r($sms->errors());
}