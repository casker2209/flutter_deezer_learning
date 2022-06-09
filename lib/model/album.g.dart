// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumResponse _$AlbumResponseFromJson(Map<String, dynamic> json) {
  return AlbumResponse(
    data: (json['data'] as List<dynamic>)
        .map((e) => Album.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AlbumResponseToJson(AlbumResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return Album(
    id: json['id'] as int,
    title: json['title'] as String,
    cover: json['cover'] as String,
  );
}

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cover': instance.cover,
    };
