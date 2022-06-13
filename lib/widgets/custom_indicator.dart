import 'package:flutter/material.dart';

import '../utils/constant.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    Key? key,
    required this.splashImages,
    required this.currentPageIndex,
  }) : super(key: key);

  final List<String> splashImages;
  final int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(splashImages.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: index == currentPageIndex ? primaryColor : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          );
        }));
  }
}
