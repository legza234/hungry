import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';
import 'package:hungry/features/auth/data/user_model.dart';

import '../../../core/network/api_error.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitial());

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(AuthLoading());

    try {
      final user = await authRepo.register(name, email, password, phone);
      emit(AuthSuccess(user));
    } catch (e) {
      String errorMessage = "Something went wrong";

      if (e is ApiError) {
        errorMessage = e.message;
      }

      emit(AuthFailure(errorMessage));
    }
  }
}
