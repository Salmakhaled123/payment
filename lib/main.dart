import 'package:flutter/material.dart';

import 'features/checkout/presentation/views/my_cart_view.dart';

void main() {
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
// intent payment sheet (paymentIntentClientSecret)
// presentPaymentSheet
