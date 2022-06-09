import 'package:json_annotation/json_annotation.dart';
part 'artist.g.dart';

@JsonSerializable()
class ArtistResponse{
  ArtistResponse({required this.data});
  @JsonKey(name:'data')
  List<Artist> data;
  factory ArtistResponse.fromJson(Map<String,dynamic> json) => _$ArtistResponseFromJson(json);
  Map<String,dynamic> toJson() => _$ArtistResponseToJson(this);
}

@JsonSerializable()
class Artist {
  Artist({required this.id,required this.name,required this.picture});
  @JsonKey(name:'id')
  int id;
  @JsonKey(name:'name')
  String name;
  @JsonKey(name:'picture')
  String picture;
  factory Artist.fromJson(Map<String,dynamic> json) => _$ArtistFromJson(json);
  Map<String,dynamic> toJson() => _$ArtistToJson(this);
}