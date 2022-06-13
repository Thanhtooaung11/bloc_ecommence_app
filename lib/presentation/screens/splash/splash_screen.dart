import 'package:bloc_ecommence_app/presentation/screens/splash/components/splash_header.dart';
import 'package:bloc_ecommence_app/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_indicator.dart';
import '../../../widgets/default_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List<String> splashImages = [
    'assets/images/splash_1.png',
    'assets/images/splash_2.png',
    'assets/images/splash_3.png',
  ];

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: appDefaultPadding,
            ),
            child: Column(
              children: [
                const Spacer(),
                const SplashHeader(),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: PageView.builder(
                    itemCount: splashImages.length,
                    itemBuilder: (_, i) {
                      return Image.asset(
                        splashImages[i],
                        height: 250,
                      );
                    },
                    onPageChanged: (index) {
                      currentPageIndex = index;
                      setState(() {});
                    },
                  ),
                ),
                const Spacer(),
                CustomIndicator(
                    splashImages: splashImages,
                    currentPageIndex: currentPageIndex),
                const Spacer(),
                DefaultButton(
                  text: 'Continue',
                  onTap: () {
                    Navigator.pushReplacementNamed(context, appLoginScreen);
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
