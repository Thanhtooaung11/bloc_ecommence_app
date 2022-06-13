import 'package:bloc_ecommence_app/presentation/screens/home/components/custom_tab.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constant.dart';

class CustomTabBar extends StatefulWidget {
  final TabController tabController;
  const CustomTabBar({Key? key, required this.tabController}) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int categoryId = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: TabBar(
        onTap: (value) {
          categoryId = value;
          // print(categoryId);
          setState(() {});
        },
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        isScrollable: true,
        controller: widget.tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: const EdgeInsets.only(right: 10),
        labelPadding: const EdgeInsets.only(right: 10),
        indicator: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        tabs: List.generate(
          categroies.length,
          (index) {
            return CustomTab(
                categoryName: categroies[index]);

          },
        ),
      ),
    );
  }
}
