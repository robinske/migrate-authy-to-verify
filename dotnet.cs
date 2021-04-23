using System;
using System.Net.Http;
using System.Collections.Generic;


class Program
{
    static void Main(string[] args)
    {
        // Your API key from twilio.com/console/authy/applications
        // DANGER! This is insecure. See http://twil.io/secure
        var AuthyAPIKey = "your_api_key";
        var AuthyId = "user's authy id";

        // Send verification
        using (var client = new HttpClient())
        {
            client.DefaultRequestHeaders.Add("X-Authy-API-Key", AuthyAPIKey);

            HttpResponseMessage response = client.GetAsync(
                $"https://api.authy.com/protected/json/sms/{AuthyId}").Result;

            HttpContent responseContent = response.Content;
            Console.WriteLine(responseContent.ReadAsStringAsync().Result);
        }

        // Check verification
        using (var client = new HttpClient())
        {
            client.DefaultRequestHeaders.Add("X-Authy-API-Key", AuthyAPIKey);

            var token = 1234567;

            HttpResponseMessage response = client.GetAsync(
                $"https://api.authy.com/protected/json/verify/{token}/{AuthyId}").Result;

            HttpContent responseContent = response.Content;
            Console.WriteLine(responseContent.ReadAsStringAsync().Result);
        }
    }
}