// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreResponse _$GenreResponseFromJson(Map<String, dynamic> json) {
  return GenreResponse(
    data: (json['data'] as List<dynamic>)
        .map((e) => Genre.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GenreResponseToJson(GenreResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return Genre(
    id: json['id'] as int,
    name: json['name'] as String,
    picture: json['picture'] as String,
  );
}

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture': instance.picture,
    };
