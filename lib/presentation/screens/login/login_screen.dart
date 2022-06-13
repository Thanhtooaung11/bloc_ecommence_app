import 'package:bloc_ecommence_app/data/model/user_model.dart';
import 'package:bloc_ecommence_app/logic/cubit/auth_cubit.dart';
import 'package:bloc_ecommence_app/presentation/screens/login/components/input_field.dart';
import 'package:bloc_ecommence_app/utils/constant.dart';
import 'package:bloc_ecommence_app/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode usernameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  // //kminchelle',
  //   password: '0lelplR

  @override
  void initState() {
    userController.text = 'kminchelle';
    passwordController.text = '0lelplR';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              InputField(
                controller: userController,
                focusNode: usernameFocus,
                hintText: 'Username',
                validator: (e) => e?.isEmpty == true ? 'Enter username' : null,
                onEditingComplete: passwordFocus.requestFocus,
              ),
              SizedBox(height: appDefaultPadding),
              InputField(
                controller: passwordController,
                focusNode: passwordFocus,
                hintText: 'Password',
                validator: (e) => e?.isEmpty == true ? 'Enter email' : null,
                onEditingComplete: login,
              ),
              const SizedBox(height: 20),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoadingState) {
                    showStateDialog(context, 'Please wait...');
                  }

                  ///LoginSuccess
                  else if (state is LoginSuccessState) {
                    Navigator.pop(context);

                    Navigator.pushNamed(context, appHomeScreen,
                        arguments: state.user.toMap());

                  }

                  ///LoginFailed
                  else if (state is LoginFailedState) {
                    Navigator.pop(context);
                    showStateDialog(context, 'Incorrect password or email',
                        isOkBtn: true);
                  }
                },
                child: DefaultButton(
                  text: 'Login',
                  onTap: login,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login(){
    Map<String, dynamic> data = {
      'username': userController.text,
      'password': passwordController.text,
    };

    context.read<AuthCubit>().login(data);
  }

  Future<dynamic> showStateDialog(BuildContext context, String text,
      {bool? isOkBtn}) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: isOkBtn != null ? const Text('Login Action') : null,
          content: Text(text),
          actions: isOkBtn != null
              ? [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('ok'),
                  )
                ]
              : null,
        );
      },
    );
  }
}
