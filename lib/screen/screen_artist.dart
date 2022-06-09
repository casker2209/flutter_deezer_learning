import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deezer_learning/screen/screen_album.dart';
import 'package:flutter_deezer_learning/utils/dioclient.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deezer_learning/utils/response_state.dart';
import '../bloc/bloc_artist.dart';
import '../model/artist.dart';
import '../model/genre.dart';

class ArtistScreenView extends StatelessWidget{
  Genre genre;
  ArtistScreenView({Key? key,required this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(title: Text(genre.name)),
       body:ArtistGridView(genreId: genre.id.toString()));
  }

}



class ArtistGridView extends StatefulWidget{
  String genreId;
  ArtistGridView({required this.genreId});
  @override
  State<StatefulWidget> createState() {
    return ArtistGridViewState();
  }

}

class ArtistGridViewState extends State<ArtistGridView>{
  late ArtistBloc bloc;
  @override
  void initState() {
    bloc = ArtistBloc()..add(DioGet(query: widget.genreId));
    super.initState();
  }
  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context,state){
          if(state is DioLoadingState){
            return const Center(child:SizedBox(height:20,child:CircularProgressIndicator()));
          }
          else if(state is DioLoadedState){
            return SingleChildScrollView(child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.data.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: MediaQuery.of(context).size.width/2),
                itemBuilder: (context,index){
                  return ArtistCardView(artist: state.data.elementAt(index));
                }));
          }
          else return Text("");
        });
    }
}

class ArtistCardView extends StatelessWidget{
  Artist artist;
  ArtistCardView({required this.artist});
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AlbumScreenView(artist: artist)));

        },
          child:
          Card(
              margin: EdgeInsets.all(5),
              child: Column(
          children: [
            Expanded(child: Image.network(artist.picture, fit: BoxFit.cover)),
            Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Text(artist.name,style: const TextStyle(fontWeight: FontWeight.bold)))],
        )
    ));
  }
}