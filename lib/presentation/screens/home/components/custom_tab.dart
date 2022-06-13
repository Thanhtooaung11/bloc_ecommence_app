import 'package:flutter/material.dart';

import '../../../../utils/constant.dart';

class CustomTab extends StatelessWidget {
  final String categoryName;

  const CustomTab({
    Key? key,
    required this.categoryName,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(2),
      width: 100,
      // height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade400.withOpacity(0.3),

      ),

      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          categoryName,
          style: const TextStyle(
            fontSize: 17,
            color: primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
