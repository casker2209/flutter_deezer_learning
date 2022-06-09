import 'package:flutter_deezer_learning/model/song.dart';
import 'package:json_annotation/json_annotation.dart';

import 'album.dart';
import 'artist.dart';
part 'top.g.dart';
@JsonSerializable()
class TopResponse{
  TopResponse({required this.albumList,required this.songList,required this.artistList});
  @JsonKey(name:'albums')
  List<AlbumResponse> albumList;
  @JsonKey(name:'tracks')
  List<SongResponse> songList;
  @JsonKey(name:'artists')
  List<ArtistResponse> artistList;

  factory TopResponse.fromJson(Map<String,dynamic> json) => _$TopResponseFromJson(json);
  Map<String,dynamic> toJson() => _$TopResponseToJson(this);
}