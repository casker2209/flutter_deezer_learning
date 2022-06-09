import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/album.dart';

class SongListScreen extends StatelessWidget{
  Album album;
  SongListScreen({required this.album});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(title:Text("")),
    body:Container(
      child: Column(
        children: [Image.network(album.cover),]
      ),
    ));
  }
}

class AlbumInformation extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}