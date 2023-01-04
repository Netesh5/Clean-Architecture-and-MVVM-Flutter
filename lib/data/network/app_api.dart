import 'package:cleanarchmvvm/application/constant/constant.dart';
import 'package:cleanarchmvvm/data/responses/response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customers/login")
  Future<AuthResponse> login();
}
