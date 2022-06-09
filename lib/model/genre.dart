import 'package:json_annotation/json_annotation.dart';
part 'genre.g.dart';

@JsonSerializable()
class GenreResponse{
  GenreResponse({required this.data});

  @JsonKey(name: 'data')
  List<Genre> data;

  factory GenreResponse.fromJson(Map<String,dynamic> json) => _$GenreResponseFromJson(json);
  Map<String,dynamic> toJson() => _$GenreResponseToJson(this);
}

@JsonSerializable()
class Genre {
  Genre({required this.id,required this.name,required this.picture});
  @JsonKey(name:"id")
  int id;
  @JsonKey(name:"name")
  String name;
  @JsonKey(name:"picture")
  String picture;
  factory Genre.fromJson(Map<String,dynamic> json) => _$GenreFromJson(json);
  Map<String,dynamic> toJson() => _$GenreToJson(this);
}