import 'package:dio/dio.dart';
import 'package:intertech/core/interfaces/service_interface.dart';
import 'package:intertech/core/models/api_response_model.dart';

class DioBaseServices implements IBaseService {
  final Dio _dio = Dio();

  @override
  Future<ApiResponseModel> getRequest({required String url}) async {
    try {
      Response response = await _dio.get(url);
      return ApiResponseModel(
        data: response.data,
        statusCode: response.statusCode ?? 0,
      );
    } catch (e) {
      throw Exception( e.toString());
    }
  }

  @override
  Future<ApiResponseModel> postRequest(Object? requestBody, {required String url}) async {
    try {
      Response response = await _dio.post(
        url,
        data: requestBody,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
      );
      return ApiResponseModel(
        data: response.data,
        statusCode: response.statusCode ?? 0,
      );
    } catch (e) {
      throw Exception( e.toString());
    }
  }

  @override
  Future<ApiResponseModel> deleteRequest(Object? requestBody, {required String url}) async {
    try {
      Response response = await _dio.delete(
        url,
        data: requestBody,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
      );
      return ApiResponseModel(
        data: response.data,
        statusCode: response.statusCode ?? 0,
      );
    } catch (e) {
      throw Exception( e.toString());
    }
  }

  @override
  Future<ApiResponseModel> putRequest(Object? requestBody, {required String url}) async {
    try {
      Response response = await _dio.put(
        url,
        data: requestBody,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
      );
      return ApiResponseModel(
        data: response.data,
        statusCode: response.statusCode ?? 0,
      );
    } catch (e) {
      throw Exception( e.toString());
    }
  }
}
