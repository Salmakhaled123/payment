import 'package:flutter/material.dart';
import 'package:payment/features/checkout/presentation/views/widgets/my_cart_view_body.dart';

import '../../../../core/utils/widgets/custom_app_bar.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Cart'),
      body: const MyCartViewBody(),
    );
  }
}
