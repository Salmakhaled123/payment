import 'package:flutter/material.dart';
class CustomDashedLine extends StatelessWidget {
  const CustomDashedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: List.generate(30, (index) {
      return Expanded(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Container(color: const Color(0xff0b7b7b7),height: 2,),
      ));
    }),);
  }
}
