import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intertech/core/interfaces/service_interface.dart';
import 'package:intertech/core/models/api_response_model.dart';

class HttpBaseServices implements IBaseService {
  @override
  Future<ApiResponseModel> getRequest({required String url}) async {
    try {
      Uri apiAddress = Uri.parse(url);

      Response response = await get(apiAddress, headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      });
      return ApiResponseModel(
          data: response.body, statusCode: response.statusCode);
    } catch (e) {
      debugPrint(e.toString());
      throw HttpException(e.toString());
    }
  }

  @override
  Future<ApiResponseModel> postRequest(Object? requestBody,
      {required String url}) async {
    //post request , Where is Object called when this function is used? value final requestBody=jsonEncode(Map<String,dynamic>); It should be forwarded as.
    try {
      Uri apiAddress = Uri.parse(url);
      //There is no need for a header section in this application, but since there will be a fixed header in the APIs used,
      // basic features have been added for example use as desired.
      Response response = await post(apiAddress, headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      });
      return ApiResponseModel(
          data: response.body, statusCode: response.statusCode);
    } catch (e) {
      debugPrint(e.toString());
      throw HttpException(e.toString());
    }
  }

  @override
  Future<ApiResponseModel> deleteRequest(Object? requestBody,
      {required String url}) async {
    try {
      Uri apiAddress = Uri.parse(url);

      Response response = await delete(apiAddress, headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      });
      return ApiResponseModel(
          data: response.body, statusCode: response.statusCode);
    } catch (e) {
      debugPrint(e.toString());
      throw HttpException(e.toString());
    }
  }

  @override
  Future<ApiResponseModel> putRequest(Object? requestBody,
      {required String url}) async {
    try {
      Uri apiAddress = Uri.parse(url);

      Response response = await put(apiAddress, headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      });
      return ApiResponseModel(
          data: response.body, statusCode: response.statusCode);
    } catch (e) {
      debugPrint(e.toString());
      throw HttpException(e.toString());
    }
  }
}
