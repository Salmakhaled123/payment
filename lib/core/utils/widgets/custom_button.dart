import 'package:flutter/material.dart';

import '../styles.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.onTap, required this.text}) : super(key: key);
final void Function()? onTap;
final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap:onTap ,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: ShapeDecoration(
          color: const Color(0xFF34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child:  Center(
          child: Text(text,style: Styles.style22,
          ),
        ),
      ),
    );
  }
}
