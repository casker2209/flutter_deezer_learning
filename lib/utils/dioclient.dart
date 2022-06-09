import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_deezer_learning/model/album.dart';
import 'package:flutter_deezer_learning/model/artist.dart';
import 'package:flutter_deezer_learning/model/genre.dart';
import 'package:flutter_deezer_learning/model/song.dart';
import 'package:flutter_deezer_learning/model/top.dart';
import 'package:dio/adapter.dart';
class DioClient{
  final Dio _dio = Dio(BaseOptions(
    baseUrl:"https://api.deezer.com/",
    connectTimeout: 3000,
    receiveTimeout: 3000
  ))..interceptors.add(Logging());



  Future<List<Genre>> getAllGenre() async{
    Response allGenreResponse = await _dio.get('genre');
    GenreResponse genreResponse = GenreResponse.fromJson(allGenreResponse.data);
    return genreResponse.data;
  }

  Future<List<Artist>> getArtistByGenreId({required String genreId}) async{
    Response artistResponse = await _dio.get('genre/'+genreId+'/artists');
    return ArtistResponse.fromJson(artistResponse.data).data;
  }
  Future<List<Album>> getAlbumByArtistId({required String artistId}) async{
    Response albumResponse = await _dio.get('artist/'+artistId+'/albums');
    return AlbumResponse.fromJson(albumResponse.data).data;
  }
  Future<List<Song>> getSongByAlbumId({required String albumId}) async{
    Response songResponse = await _dio.get('album/'+albumId+'/tracks');
    return SongResponse.fromJson(songResponse.data).data;
  }
  Future<TopResponse> getTopSong() async{
    Response response = await _dio.get('editorial/0/charts');
    return TopResponse.fromJson(response.data);
  }
  Future<List<Song>> getSongByQuery({required String query}) async{
    Response songResponse = await _dio.get("search/track?limit=5",queryParameters: {"q":query});
    return SongResponse.fromJson(songResponse.data).data;
  }
  Future<List<Album>> getAlbumByQuery({required String query}) async{
    Response albumResponse = await _dio.get("search/album?limit=5",queryParameters: {"q":query});
    return AlbumResponse.fromJson(albumResponse.data).data;
  }
  Future<List<Artist>> getArtistByQuery({required String query}) async{
    Response artistResponse = await _dio.get("search/artist?limit=5",queryParameters: {"q":query});
    return ArtistResponse.fromJson(artistResponse.data).data;
  }
}

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler){
    options.headers["Accept"] = "application/json";
    options.headers["Access-Control-Allow-Origin"] = "*";
    options.headers["Access-Control-Allow-Credentials"]= 'true';
    options.headers["Access-Control-Allow-Methods"]= "*";
    options.headers["Access-Control-Allow-Headers"]= "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale";

    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    print(response);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    print(err.message);
    return super.onError(err, handler);
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
