import 'package:flutter/material.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_details_view_body.dart';

import '../../../../core/utils/widgets/custom_app_bar.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Payment Details'),
      body: const PaymentDetailsViewBody(),
    );
  }
}
