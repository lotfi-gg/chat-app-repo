import 'package:chat_app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class logo extends StatelessWidget {
  const logo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'images/logo.svg',
      height: 150,
      colorFilter: ColorFilter.mode(myPrimaryColor, BlendMode.srcIn),
    );
  }
}
