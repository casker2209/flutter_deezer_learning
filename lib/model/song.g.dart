// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongResponse _$SongResponseFromJson(Map<String, dynamic> json) {
  return SongResponse(
    data: (json['data'] as List<dynamic>)
        .map((e) => Song.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SongResponseToJson(SongResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Song _$SongFromJson(Map<String, dynamic> json) {
  return Song(
    id: json['id'] as int,
    title: json['title'] as String,
    duration: json['duration'] as int,
    artist: json['artist'] == null
        ? null
        : Artist.fromJson(json['artist'] as Map<String, dynamic>),
    album: json['album'] == null
        ? null
        : Album.fromJson(json['album'] as Map<String, dynamic>),
    preview: json['preview'] as String,
  );
}

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'duration': instance.duration,
      'preview': instance.preview,
      'artist': instance.artist,
      'album': instance.album,
    };
