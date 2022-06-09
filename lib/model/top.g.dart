// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopResponse _$TopResponseFromJson(Map<String, dynamic> json) {
  return TopResponse(
    albumList: (json['albums'] as List<dynamic>)
        .map((e) => AlbumResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    songList: (json['tracks'] as List<dynamic>)
        .map((e) => SongResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    artistList: (json['artists'] as List<dynamic>)
        .map((e) => ArtistResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TopResponseToJson(TopResponse instance) =>
    <String, dynamic>{
      'albums': instance.albumList,
      'tracks': instance.songList,
      'artists': instance.artistList,
    };
