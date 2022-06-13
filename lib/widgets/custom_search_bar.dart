import 'package:flutter/material.dart';

import '../utils/constant.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: appDefaultPadding),
      margin: EdgeInsets.symmetric(horizontal: appDefaultPadding),
      // height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.5),
              offset: const Offset(0, 1),
              blurRadius: 3,
            )
          ]),
      child: const TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none),
            prefixIcon: Icon(
              Icons.search,
              color: primaryColor,
            ),
            hintText: 'Search',
            hintStyle: TextStyle(
              color: primaryColor,
            )),
        cursorColor: primaryColor,
        style: TextStyle(color: primaryColor),
      ),
    );
  }
}
