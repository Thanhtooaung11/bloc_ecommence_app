import 'package:bloc_ecommence_app/data/api/auth.dart';
import 'package:bloc_ecommence_app/data/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthService authService = AuthService();

  AuthCubit() : super(AuthInitialState());

  void login(Map<String, dynamic> data) async {
    emit(AuthLoadingState());
    try {
      UserModel maodel =
          await authService.auth('https://dummyjson.com/auth/login', data);
      emit(LoginSuccessState(user: maodel));
    } catch (e) {
      print(e);
      emit(LoginFailedState());
    }
  }
}
