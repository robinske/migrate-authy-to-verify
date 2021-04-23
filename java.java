// Install the Authy Java helper library from github.com/twilio/authy-java

import com.authy.AuthyApiClient;
import com.authy.api.*;

public class Example {
    // Your API key from twilio.com/console/authy/applications
    // DANGER! This is insecure. See http://twil.io/secure
    public static final String API_KEY = "your_api_key";
    public static final String AUTHY_ID = "user's authy id";

    public static void main( String[] args ) throws Exception
    {
        AuthyApiClient client = new AuthyApiClient(API_KEY);

        // Send verification
        Users users = client.getUsers();
        Hash response = users.requestSms(AUTHY_ID);

        if (response.isOk()) {
            System.out.println(response.getMessage());
        } else {
            System.out.println(response.getError());
        }

        // Check verification
        Tokens tokens = client.getTokens();
        Token response = tokens.verify(AUTHY_ID, "1297431");

        if (response.isOk()) {
            // Success
            System.out.println(response.toMap());
        } else {
            // Invalid token
            System.out.println(response.getError());
        }
    }
}