import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_error.dart';
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
  Future<UserModel> getProfileData() async {
    try {
      final response = await apiService.get('/profile');

      final data = response['data'];
      // Handle cases where user data is nested under 'user' key
      final userData = data is Map && data.containsKey('user') ? data['user'] : data;

      return UserModel.fromJson(userData);

    } on DioError catch (e) {
      throw ApiException.handleError(e);
    } catch (e) {
     throw ApiError(message: "An error occurred while fetching profile: ${e.toString()}");
    }
  }

  // UPDATE PROFILE
  Future<UserModel> updateProfileData({
    String? name,
    String? email,
    String? address,
    String? password,
    File? image,
  }) async {
    try {
      final Map<String, dynamic> data = {
        '_method': 'PUT', // Required for Laravel to handle PUT in a POST request
      };

      if (name != null) data['name'] = name;
      if (email != null) data['email'] = email;
      if (address != null) data['address'] = address;
      if (password != null && password.isNotEmpty) {
        data['password'] = password;
      }

      if (image != null) {
        data['image'] = await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        );
      }

      // Always use FormData to ensure the Content-Type is multipart/form-data
      final formData = FormData.fromMap(data);

      // Post to the '/user' endpoint and pass formData directly
      final response = await apiService.post('/user', formData as Map<String, dynamic>);

      // Handle cases where user data is nested
      final responseData = response['data'];
      final userJson = responseData is Map && responseData.containsKey('user')
          ? responseData['user']
          : responseData;

      return UserModel.fromJson(userJson);

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
