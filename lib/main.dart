import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/utils/api_keys.dart';

import 'features/checkout/presentation/views/my_cart_view.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const CheckOutApp());
}

class CheckOutApp extends StatelessWidget {
  const CheckOutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}

// paymentIntentObject = create payment intent (amount,currency) => call for api
// init payment sheet (paymentIntentClientSecret)
// presentPaymentSheet

//PaymentIntentModel=>create payment intent (amount,currency,customerId)
// keySecret =>create ephemeralKey(stripeVersion,customerId)
//initPaymentSheet(merchantDisplayName,intentClientSecret,ephemeralKeySecret)
//presentPaymentSheet()
