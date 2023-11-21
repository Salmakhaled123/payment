import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/features/checkout/data/paypal_models/amount_model.dart';
import 'package:payment/features/checkout/data/paypal_models/item_list_model.dart';
import 'package:payment/features/checkout/presentation/view_model/payment_cubit.dart';
import 'package:payment/features/checkout/presentation/views/thank_you_view.dart';

import '../../../../../core/utils/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const ThankYouView();
          }));
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            // PaymentIntentInputModel paymentIntentInputModel =
            //     PaymentIntentInputModel(
            //         amount: '100',
            //         currency: 'USD',
            //         customerId: 'cus_P2fUewtzC282P7');
            // BlocProvider.of<PaymentCubit>(context)
            //     .makePayment(paymentIntentInputModel: paymentIntentInputModel);
            var transactionData = getTransactions();
            executePaypalPayment(context, transactionData);
          },
          text: 'Continue',
          isLoading: state is PaymentLoading ? true : false,
        );
      },
    );
  }

  void executePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemsList itemList}) transactionData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.payPalClientId,
        secretKey: ApiKeys.payPalSecretKey,
        transactions: [
          {
            "amount": transactionData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionData.itemList.toJson()
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const ThankYouView();
          }));
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, ItemsList itemList}) getTransactions() {
    var amount = AmountModel(
        total: '100',
        currency: 'USD',
        details: Details(shipping: '0', shippingDiscount: 0, subtotal: '100'));
    List<OrderItemsModel> orders = [
      OrderItemsModel(name: 'Apple', currency: 'USD', price: '4', quantity: 10),
      OrderItemsModel(name: 'Apple', currency: 'USD', price: '5', quantity: 12),
    ];
    var itemList = ItemsList(items: orders);
    return (amount: amount, itemList: itemList);
  }
}
