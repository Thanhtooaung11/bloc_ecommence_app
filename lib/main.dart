import 'dart:io';

import 'package:bloc_ecommence_app/data/api/api_service.dart';
import 'package:bloc_ecommence_app/data/api/auth.dart';
import 'package:bloc_ecommence_app/data/api/cart_repository.dart';
import 'package:bloc_ecommence_app/data/api/product_api.dart';
import 'package:bloc_ecommence_app/logic/bloc/fetch_product_bloc/product_bloc.dart';
import 'package:bloc_ecommence_app/logic/bloc/get_order_bloc/get_order_bloc.dart';
import 'package:bloc_ecommence_app/logic/cubit/auth_cubit.dart';
import 'package:bloc_ecommence_app/presentation/routes/app_routes.dart';
import 'package:bloc_ecommence_app/presentation/screens/home/home_screen.dart';
import 'package:bloc_ecommence_app/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();

  runApp(
    MyApp(
      appRoutes: AppRoutes(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRoutes appRoutes;
  const MyApp({Key? key, required this.appRoutes}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(
            create: (context) =>
                FetchProductBloc(productApi: ProductApi.instance)),
        BlocProvider(
            create: (context) => GetOrderBloc(repository: CartRepository())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        // home: const SplashScreen(),
        onGenerateRoute: appRoutes.ongenerateRoute,
      ),
    );
  }
}
