import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/core/utils/api_service.dart';
import 'package:payment/features/checkout/data/payment_intent_input/payment_intent_input_model.dart';
import 'package:payment/features/checkout/data/payment_intent_model/PaymentIntentModel.dart';

class StripeService {
  final ApiService apiService = ApiService();
  // PaymentIntentModel cretePaymentIntent(
  //     PaymentIntentInputModel paymentIntentInputModel) {
  //   apiService.post(
  //     url: 'https://api.stripe.com/v1/payment_intents',
  //     body: paymentIntentInputModel.toJson(),
  //     token: ApiKeys.secretKey,
  //   );
  // }
}
