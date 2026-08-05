import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../endpoints.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio) = _ApiService;

  @POST(EndPoints.login)
  Future<dynamic> login(@Body() Map<String, dynamic> body);

  @POST(EndPoints.upload)
  @MultiPart()
  Future<dynamic> uploadImages(
    @Body() FormData formData, {
    @SendProgress() ProgressCallback? onSendProgress,
    @CancelRequest() CancelToken? cancelToken,
  });
}
