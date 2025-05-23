import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:frontend/features/login/data/services/securestorage_service.dart';

class StripeService {
  //final GmailService gmailService;

  StripeService(/*this.gmailService*/
  
  );

  static final StripeService instance = StripeService(/*GmailService()*/);


  Future<void> makePayment(
    /*BuildContext context,*/ {required double amount}
    /*VoidCallback onPremiumUpdated*/
  ) async {
    final Dio dio = Dio();
    try {
      final token = await SecureStorage.getAccessToken();
      final response = await dio.post("items/create-payment-intent", 
      data: {
        "token": token,
        "amount": amount ,
      });
      final paymentIntent = response.data;
      print("Payment Intent: $paymentIntent");
      if (paymentIntent == null) return;

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent["client_secret"],
          merchantDisplayName: "Shop",
        ),
      );

      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPayment(
          paymentIntentClientSecret: paymentIntent["client_secret"]);
      //await handlePaymentAndSendEmail(context, paymentIntent["id"], /*mockMainUser.email, onPremiumUpdated*/);
    } catch (e) {
      print("Error in makePayment: $e");
    }
  }

  // Future<Map<String, dynamic>?> createPaymentIntent(
  //   double amount, String currency) async {
  //   try {
  //     final Dio dio = Dio();
  //     Map<String, dynamic> data = {
  //       "amount": (amount * 100).toInt(),
  //       "currency": currency
  //     };

  //     var response = await dio.post("https://api.stripe.com/v1/payment_intents",
  //         data: data,
  //         options:
  //             Options(contentType: Headers.formUrlEncodedContentType, headers: {
  //           "Authorization": "Bearer $stripeSecretKey",
  //           "Content-Type": 'application/x-www-form-urlencoded'
  //         }));
  //     if (response.data != null) {
  //       //print (response.data);
  //       return response.data;
  //     }
  //     return null;
  //   } catch (e) {
  //     //print(e);
  //   }
  //   return null;
  // }

  Future<void> handlePaymentAndSendEmail(
    BuildContext context,
    String paymentIntentID,
    //String userEmail,
    //VoidCallback onPremiumUpdated
  ) async {
    // try {
    //   //mockMainUser.isPremiumUser = true;
    //   //onPremiumUpdated();

    //   // if (context.mounted) {
    //   //   Navigator.pop(context, true);
    //   // }

    //   //print("Payment confirmed successfully!");
    //   //await sendPaymentConfirmationEmail(paymentIntentID, userEmail);
    // } catch (e) {
    //   //print("Error confirming payment: $e");
    // }
  }

  // Future<void> sendPaymentConfirmationEmail(
  //     String paymentIntentId, String recipientEmail) async {
  //   bool success = await gmailService.sendEmail(
  //     to: recipientEmail,
  //     subject: "Welcome to JobLinc!",
  //     body: "Your premium plan is now active. 🎉",
  //   );

  //   // if (success) {
  //   //   print("Email sent successfully!");
  //   // } else {
  //   //   print("Failed to send email.");
  //   // }
  // }
}
