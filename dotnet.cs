using System;
using Twilio;
using Twilio.Rest.Verify.V2.Service;


class Program
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Token at twilio.com/console
        // and set the environment variables. See http://twil.io/secure
        string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

        // Create a Verify Service in the Console: https://www.twilio.com/console/verify/services
        string verifyServiceSid = Environment.GetEnvironmentVariable("VERIFY_SERVICE_SID");

        // Use this instead of the Authy ID.
        // Must be in E.164 format: https://www.twilio.com/docs/glossary/what-e164
        string toNumber = "+15017122661";

        TwilioClient.Init(accountSid, authToken);

        // Send verification
        var verification = VerificationResource.Create(
            to: toNumber,
            channel: "sms",
            pathServiceSid: verifyServiceSid
        );

        Console.WriteLine(verification.Sid);

        // Check verification
        var verificationCheck = VerificationCheckResource.Create(
            to: toNumber,
            code: "1234",
            pathServiceSid: verifyServiceSid
        );

        Console.WriteLine(verificationCheck.Status);
    }
}