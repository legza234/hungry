import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_service.dart';
import 'package:hungry/features/auth/data/user_model.dart';

import '../../../core/network/api_excption.dart';
import '../../../core/utils/pref_helper.dart';

class AuthRepo {
  ApiService apiService = ApiService();

  // LOGIN
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await apiService.post(
        '/login',
        {
          'email': email,
          'password': password,
        },
      );

      final user = UserModel.fromJson(response['data']);

      if (user.token != null) {
        await PrefHelper.saveToken(user.token!);
      }

      return user;

    } on DioError catch (e) {
      throw ApiException.handleError(e);

    } catch (e) {
      rethrow;
    }
  }

  // REGISTER
  Future<UserModel> register(
      String name, String email, String password, String phone) async {
    try {
      final response = await apiService.post(
        '/register',
        {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': password,
          'phone': phone,
        },
      );

      final user = UserModel.fromJson(response['data']);

      if (user.token != null) {
        await PrefHelper.saveToken(user.token!);
      }

      return user;

    } on DioError catch (e) {
      throw ApiException.handleError(e);

    } catch (e) {
      rethrow;
    }
  }

  // GET PROFILE
  Future<UserModel> getProfile() async {
    try {
      final response = await apiService.get('/user');

      final data = response['data'];
      final userData = data is Map && data.containsKey('user')
          ? data['user']
          : data;

      return UserModel.fromJson(userData);

    } on DioError catch (e) {
      throw ApiException.handleError(e);

    } catch (e) {
      rethrow;
    }
  }

  // UPDATE PROFILE
  Future<UserModel> updateProfile({
    required String name,
    required String email,
    required String phone,
  }) async {
    try {
      final response = await apiService.post(
        '/user',
        {
          '_method': 'PUT', // Laravel only
          'name': name,
          'email': email,
          'phone': phone,
        },
      );

      return UserModel.fromJson(response['data']);

    } on DioError catch (e) {
      throw ApiException.handleError(e);

    } catch (e) {
      rethrow;
    }
  }

  // LOGOUT
  Future<void> logout() async {
    try {
      await apiService.post('/logout', {});
      await PrefHelper.clearToken();

    } on DioError catch (e) {
      throw ApiException.handleError(e);

    } catch (e) {
      rethrow;
    }
  }
}
