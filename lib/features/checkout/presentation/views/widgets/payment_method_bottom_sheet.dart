import 'package:flutter/material.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_methods_list_view.dart';
import 'custom_button_bloc_consumer.dart';

class PaymentsMethodsBottomSheet extends StatelessWidget {
  const PaymentsMethodsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16,
          ),
          PaymentMethodsListView(),
          SizedBox(
            height: 32,
          ),
          CustomButtonBlocConsumer()
        ],
      ),
    );
  }
}
