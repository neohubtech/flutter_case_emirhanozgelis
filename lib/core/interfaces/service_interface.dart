

//Such a structure is not needed for requests, but it has been added to code in accordance with the open-closed principle in case the project requirements change.
// This structure is generally actively used in payment systems.

import 'package:intertech/core/models/api_response_model.dart';

abstract class IBaseService {
  Future<ApiResponseModel> getRequest({required String url});
  Future<ApiResponseModel> postRequest(Object? requestBody,{required String url});
  Future<ApiResponseModel> deleteRequest(Object? requestBody,{required String url});
  Future<ApiResponseModel> putRequest(Object? requestBody,{required String url});
}
