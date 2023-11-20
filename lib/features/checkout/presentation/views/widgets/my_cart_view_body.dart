import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/checkout/data/repos/checkout_repo_imp.dart';
import 'package:payment/features/checkout/presentation/view_model/payment_cubit.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_method_bottom_sheet.dart';
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
                      return BlocProvider(
                        create: (context) => PaymentCubit(CheckoutRepoImp()),
                        child: const PaymentsMethodsBottomSheet(),
                      );
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
