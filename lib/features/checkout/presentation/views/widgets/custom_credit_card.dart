import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
class CustomCreditCard extends StatefulWidget {
  const  CustomCreditCard({Key? key,required this.formKey,required this.autoValidateMode}) : super(key: key);
final GlobalKey<FormState> formKey;
final AutovalidateMode autoValidateMode;

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber='',expiryDate='',cardHolderName='',cvvCode='';
  bool showBackView=false;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CreditCardWidget(isHolderNameVisible: true,

            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: showBackView,
            onCreditCardWidgetChange: (value){}),
        CreditCardForm(autovalidateMode: widget.autoValidateMode,
            cardNumber: cardNumber, expiryDate: expiryDate,
            cardHolderName: cardHolderName, cvvCode: cvvCode,
            onCreditCardModelChange: (creditCardModel)
            {
              cardNumber=creditCardModel.cardNumber;
              expiryDate=creditCardModel.expiryDate;
              cardHolderName=creditCardModel.cardHolderName;
              cvvCode=creditCardModel.cvvCode;
              showBackView=creditCardModel.isCvvFocused;
              setState(() {

              });


            }, formKey: widget.formKey),
      ],
    );
  }
}