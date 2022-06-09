import 'package:json_annotation/json_annotation.dart';
part 'album.g.dart';

@JsonSerializable()
class AlbumResponse{
  AlbumResponse({required this.data});
  @JsonKey(name:'data')
  List<Album> data;
  factory AlbumResponse.fromJson(Map<String,dynamic> json) => _$AlbumResponseFromJson(json);
  Map<String,dynamic> toJson() => _$AlbumResponseToJson(this);
}

@JsonSerializable()
class Album {
  Album({required this.id,required this.title,required this.cover});
  @JsonKey(name:'id')
  int id;
  @JsonKey(name:'title')
  String title;
  @JsonKey(name:'cover')
  String cover;

  factory Album.fromJson(Map<String,dynamic> json) => _$AlbumFromJson(json);
  Map<String,dynamic> toJson() => _$AlbumToJson(this);
}