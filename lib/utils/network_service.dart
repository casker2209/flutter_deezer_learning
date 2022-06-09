import 'package:flutter_deezer_learning/utils/dioclient.dart';

class NetworkService {
  static final NetworkService instance = NetworkService._interval();
  DioClient? _dio;
  factory NetworkService() => instance;


  NetworkService._interval(){
    _dio ??= DioClient();
  }

  DioClient get dio => dio;

}