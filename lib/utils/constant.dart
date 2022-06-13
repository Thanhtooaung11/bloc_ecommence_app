import 'package:flutter/material.dart';

const String appSplashScreen = '/';
const String appHomeScreen = '/app/home';
const String appLoginScreen = '/app/login';
const String appCartScreen = '/app/cart';

const Color primaryColor = Color(0xFFfc6b03);

double appDefaultPadding = 10;

List<String> categroies = [
  'all',
  'smartphones',
  'laptops',
  'skincare',
  'furniture',
  'menswatches'
];

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(
      color: primaryColor,
    ));
