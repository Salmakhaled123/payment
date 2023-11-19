import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles.dart';

AppBar buildAppBar({ String? title}) {
  return AppBar(
      centerTitle: true,
      leading: Center(child: SvgPicture.asset('assets/images/back_arrow.svg')),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title:  Text(title ?? '',
          textAlign: TextAlign.center, style: Styles.style25));
}
