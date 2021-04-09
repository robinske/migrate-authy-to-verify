// Install the Java helper library from twilio.com/docs/java/install

import com.twilio.Twilio;
import com.twilio.rest.verify.v2.service.Verification;

public class Example {
    // Find your Account Sid and Token at twilio.com/console
    // and set the environment variables. See http://twil.io/secure
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    // Create a Verify Service in the Console: https://www.twilio.com/console/verify/services
    public static final String VERIFY_SERVICE_SID = System.getenv("VERIFY_SERVICE_SID");

    public static void main( String[] args ) throws Exception
    {
        // Use this instead of the Authy ID.
        // Must be in E.164 format: https://www.twilio.com/docs/glossary/what-e164
        String toNumber = "+15017122661";
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        // Send verification
        Verification verification = Verification.creator(
                VERIFY_SERVICE_SID,
                toNumber,
                "sms")
                .create();

        System.out.println(verification.getSid());

        // Check verification
        VerificationCheck verificationCheck = VerificationCheck.creator(
                VERIFY_SERVICE_SID,
                "1234")
            .setTo(toNumber).create();

        System.out.println(verificationCheck.getStatus());
    }
}