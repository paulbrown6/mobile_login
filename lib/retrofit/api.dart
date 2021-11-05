import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio_http/dio_http.dart';

part 'api.g.dart';

@RestApi(baseUrl: "http://dev.vlnt.expoforum.ru/api/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("auth/login")
  Future<Response> signin(@Body() Map<String, dynamic> map);
}

@JsonSerializable()
class Response {
  String accessToken;
  String expirationAccessTime;
  String refreshToken;
  String expirationRefreshTime;

  Response({required this.accessToken, required this.expirationAccessTime, required this.refreshToken, required this.expirationRefreshTime});

  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}