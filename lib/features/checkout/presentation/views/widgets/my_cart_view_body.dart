import 'package:flutter/material.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_methods_list_view.dart';
import 'package:payment/features/checkout/presentation/views/widgets/total_price.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import 'order_info_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset('assets/images/basket.png')),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: '\$42.97',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Discount',
            value: '\$0',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Shipping',
            value: '\$8',
          ),
          const Divider(
            thickness: 2,
            color: Color(0xFFC6C6C6),
            height: 34,
          ),
          const TotalPrice(title: 'Total', value: '\$50.97'),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
              text: 'Complete Payment',
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    context: context,
                    builder: (context) {
                      return const PaymentsMethodsBottomSheet();
                    });
                // Navigator.push(context, MaterialPageRoute(builder: (context){
                //   return const PaymentDetailsView();
                // }));
              }),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}

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
          CustomButton(text: 'Continue')
        ],
      ),
    );
  }
}
