import 'package:dio/dio.dart';
import 'package:hungry/core/network/dio_client.dart';

import 'api_excption.dart';

class ApiService {

  final DioClient _dioClient = DioClient();
//get
  Future <dynamic>get (String endPoint) async {
    try {
      final response = await _dioClient.dio.get(endPoint);
      return response.data;
    } on DioError catch (e) {
      throw ApiException.handleError(e);
    }
  }
// post

  Future <dynamic>post (String endPoint,Map<String,dynamic> body) async {
    try {
      final response = await _dioClient.dio.post(endPoint,data: body);
      return response.data;
    } on DioError catch (e) {
      throw ApiException.handleError(e);
    }
  }
//put
  Future <dynamic>put (String endPoint,Map<String,dynamic> body) async {
    try {
      final response = await _dioClient.dio.put(endPoint,data: body);
      return response.data;
    } on DioError catch (e) {
      throw ApiException.handleError(e);
    }
  }

  //delete
  Future <dynamic>delete (String endPoint,Map<String,dynamic> body) async {
    try {
      final response = await _dioClient.dio.delete(endPoint,data: body);
      return response.data;
    } on DioError catch (e) {
      throw ApiException.handleError(e);
    }
  }






}