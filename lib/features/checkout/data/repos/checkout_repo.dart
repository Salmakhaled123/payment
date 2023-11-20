import 'package:dartz/dartz.dart';
import 'package:payment/features/checkout/data/payment_intent_input/payment_intent_input_model.dart';

import '../../../../core/errors/failure.dart';

abstract class CheckOutRepo {
  Future<Either<Failures, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
