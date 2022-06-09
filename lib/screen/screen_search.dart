import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deezer_learning/bloc/bloc_search.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deezer_learning/screen/screen_album.dart';
import 'package:flutter_deezer_learning/screen/screen_artist.dart';
import 'package:flutter_deezer_learning/screen/screen_song_list.dart';
import 'package:flutter_deezer_learning/utils/response_state.dart';

import '../model/album.dart';
import '../model/artist.dart';
import '../model/song.dart';
class SearchScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>{
  late TextEditingController textEditingController;
  late SearchBloc bloc;
  Timer? _timer;
  @override
  void initState() {
    bloc = SearchBloc();
    textEditingController = TextEditingController();
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc:bloc,
        builder:(context,state) {
          return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.blue, //change your color here
            ),
            backgroundColor: Colors.white,
          shape:const ContinuousRectangleBorder(
              side: BorderSide(color: Colors.white),
              borderRadius:BorderRadius.horizontal(
                left: Radius.circular(15),
                right: Radius.circular(15)
              )
          ),
          title:TextField(
              controller: textEditingController,
              style:const TextStyle(decoration: TextDecoration.none
              ,fontSize:20),
              decoration: InputDecoration.collapsed(
                  hintText: 'What do you want to find?'
              ),
              onChanged: onTextChanged),
      )  ,
            body: state is DioInitialState ? Container() : state is DioLoadingState ?
              const Center(child:SizedBox(height:40,child:CircularProgressIndicator())) :
                state is DioLoadedState ?
            SingleChildScrollView(child:Column(
                  mainAxisSize: MainAxisSize.min,
                  children:[
                    state.data['song']!.isNotEmpty ?
                    Container(
                        height: MediaQuery.of(context).size.height/2,
                        child:Column(
                      mainAxisSize: MainAxisSize.min,
                      children:[
                        Container(
                            alignment:Alignment.centerLeft,
                            padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                            child:Text("Song",style:TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ))),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.data['song']!.length,
                            itemBuilder: (context,index){
                              return Card(
                                child: ListTile(
                                    onTap: () {
                                      changeScreen(song:(state.data['song']!.elementAt(index) as Song));
                                    },
                                  leading: Image.network((state.data['song']!.elementAt(index) as Song).album!.cover),
                                  title: Padding(padding:EdgeInsets.all(10),child:Text((state.data['song']!.elementAt(index) as Song).title))
                                ),
                              );
                            })
                      ]
                    )) : Container(),
                    state.data['album']!.isNotEmpty ? Container(
                        height: MediaQuery.of(context).size.height/2,
                        child:Column(
                      mainAxisSize: MainAxisSize.min,
                        children:[
                          Container(
                              alignment:Alignment.centerLeft,
                              padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                              child:Text("Album",style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ))),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.data['album']!.length,
                              itemBuilder: (context,index){
                                return  Card(
                                  child: ListTile(
                                      onTap: () {
                                        changeScreen(album:(state.data['album']!.elementAt(index) as Album));
                                      },
                                      leading: Image.network((state.data['album']!.elementAt(index) as Album).cover),
                                      title: Padding(padding:EdgeInsets.all(10),child:Text((state.data['album']!.elementAt(index) as Album).title))
                                  ),
                                );
                              })
                        ]
                    )) : Container(),
                    state.data['artist']!.isNotEmpty ? Container(
                        height: MediaQuery.of(context).size.height/2,
                        child:Column(
                      mainAxisSize: MainAxisSize.min,
                        children:[
                           Container(
                            alignment:Alignment.centerLeft,
                            padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                            child:Text("Artist",style:TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ))),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.data['artist']!.length,
                              itemBuilder: (context,index){
                                return Card(
                                  child: ListTile(
                                      onTap: () {
                                        changeScreen(artist:(state.data['artist']!.elementAt(index) as Artist));
                                      },
                                      leading: Image.network((state.data['artist']!.elementAt(index) as Artist).picture),
                                      title: Padding(padding:EdgeInsets.all(10),child:Text((state.data['artist']!.elementAt(index) as Artist).name))
                                  ),
                                );
                              })
                        ]
                    )) : Container(),

                  ]
                ))

                  : Text("Something wrong")

          );}
    );
  }

  void onTextChanged(String value) {
    if(textEditingController.text.length > 2){
      if(_timer != null){
        if(_timer!.isActive){
          _timer!.cancel();
        }
      }
      _timer = Timer(const Duration(milliseconds: 500), () {
        bloc.add(DioGet(query: textEditingController.text));
      });
    }
  }

  void changeScreen({Artist? artist,Song? song,Album? album}){
    if(artist!=null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AlbumScreenView(artist: artist)));
    }
    else if(song!=null){

    }
    else if(album!=null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SongListScreen(album: album)));
    }
  }
}

class SearchBarProvider extends ChangeNotifier{
  String? text;
  setText(String newText){
    text = newText;
    notifyListeners();
  }
}