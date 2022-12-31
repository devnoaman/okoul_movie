import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:okoul/constants/api.dart';
import 'package:okoul/services/dio_helpers.dart';

class Net {
  final dio = createDio();
  // final tokenDio = Dio(
  // BaseOptions(
  //   baseUrl: Globals().Url)
  //   );

  Net._internal();

  static final _singleton = Net._internal();

  factory Net() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: Api.baseUrl,
      queryParameters: {
        "api_key": Api.apiKey,
      },
      receiveTimeout: 50000, // 15 seconds
      connectTimeout: 50000,
      sendTimeout: 50000,
    ));

    // dio.interceptors.add(
    //   DioLoggingInterceptor(
    //     level: Level.body,
    //     compact: false,
    //   ),
    // );

    dio.interceptors.addAll({
      AppInterceptors(dio),
      // DioLoggingInterceptor(
      //   level: Level.body,
      //   compact: false,
      // ),
    });
    return dio;
  }
}

// class AppInterceptors extends Interceptor {
//   final Dio dio;

//   AppInterceptors(this.dio);

//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     var accessToken = await TokenRepository().getAccessToken();

//     if (accessToken != null) {
//       var expiration = await TokenRepository().getAccessTokenRemainingTime();

//       if (expiration.inSeconds < 60) {
//         dio.interceptors.requestLock.lock();

//         // Call the refresh endpoint to get a new token
//         await UserService()
//             .refresh()
//             .then((response) async {
//           await TokenRepository().persistAccessToken(response.accessToken);
//           accessToken = response.accessToken;
//         }).catchError((error, stackTrace) {
//           handler.reject(error, true);
//         }).whenComplete(() => dio.interceptors.requestLock.unlock());
//       }

//       options.headers['Authorization'] = 'Bearer $accessToken';
//     }

//     return handler.next(options);
//   }
// }
