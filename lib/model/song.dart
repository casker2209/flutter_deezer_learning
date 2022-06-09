import 'package:json_annotation/json_annotation.dart';

import 'album.dart';
import 'artist.dart';
part 'song.g.dart';

@JsonSerializable()
class SongResponse {
  SongResponse({required this.data});
  @JsonKey(name: 'data')
  List<Song> data;

  factory SongResponse.fromJson(Map<String,dynamic> json) => _$SongResponseFromJson(json);
  Map<String,dynamic> toJson() => _$SongResponseToJson(this);
}

@JsonSerializable()
class Song {
  Song(
      {required this.id,
      required this.title,
      required this.duration,
      this.artist,
      this.album,
      required this.preview});
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'duration')
  int duration;
  @JsonKey(name: 'preview')
  String preview;
  @JsonKey(name: 'artist')
  Artist? artist;
  @JsonKey(name: 'album')
  Album? album;


  factory Song.fromJson(Map<String,dynamic> json) => _$SongFromJson(json);
  Map<String,dynamic> toJson() => _$SongToJson(this);
}
