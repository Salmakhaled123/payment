import 'package:flutter/material.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_methods_list_view.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../thank_you_view.dart';
import 'custom_credit_card.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({Key? key}) : super(key: key);

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: PaymentMethodsListView(),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(
              formKey: formKey, autoValidateMode: autoValidateMode),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12, right: 16, left: 16),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  text: 'Pay',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    } else {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const ThankYouView();
                      }));
                      autoValidateMode = AutovalidateMode.always;
                    }
                  },
                )),
          ),
        )
      ],
    );
  }
}
