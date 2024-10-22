import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_listado/domain/repositories/login_repisitory.dart';
import 'package:flutter_listado/domain/usercase/login_user_usecase.dart';
import 'package:flutter_listado/presentations/bloc/users/login_state.dart';
import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;
  final LoginRepository authRepository;

  LoginBloc(this.loginUser, this.authRepository) : super(const LoginState()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final result = await loginUser(event.email, event.password);
      result.fold(
        (error) => emit(
            state.copyWith(isLoading: false, errorMessage: error.toString())),
        (user) => emit(state.copyWith(isLoading: false, user: user)),
      );
    });

    on<LogoutButtonPressed>((event, emit) async {
      await authRepository.logout();
      emit(const LoginState());
    });
  }
}
