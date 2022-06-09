// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistResponse _$ArtistResponseFromJson(Map<String, dynamic> json) {
  return ArtistResponse(
    data: (json['data'] as List<dynamic>)
        .map((e) => Artist.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ArtistResponseToJson(ArtistResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Artist _$ArtistFromJson(Map<String, dynamic> json) {
  return Artist(
    id: json['id'] as int,
    name: json['name'] as String,
    picture: json['picture'] as String,
  );
}

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture': instance.picture,
    };
