import 'package:flutter/material.dart';

import '../../../../utils/constant.dart';

class SplashHeader extends StatelessWidget {
  const SplashHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Tokoto'.toUpperCase(),
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
        ),
        Text(
          'Enjoy your shop!',
        )
      ],
    );
  }
}
