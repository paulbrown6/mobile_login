// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://dev.vlnt.expoforum.ru/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Response> signin(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Map<String, Response>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'auth/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    print(_result);
    print(_result.data!);
    var value = Response.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
    expirationAccessTime: json['expiration_access_time'].toString(),
    refreshToken: json['refresh_token'].toString(),
    expirationRefreshTime: json['expiration_refresh_time'].toString(),
    accessToken: json['access_token'].toString(),
  );
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
  'expiration_access_time': instance.expirationAccessTime,
  'refresh_token': instance.refreshToken,
  'expiration_refresh_time': instance.expirationRefreshTime,
  'access_token': instance.accessToken,
};
