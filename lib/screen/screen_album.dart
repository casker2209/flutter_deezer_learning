import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deezer_learning/utils/dioclient.dart';
import 'package:flutter_deezer_learning/utils/response_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc_album.dart';
import '../model/album.dart';
import '../model/artist.dart';

class AlbumScreenView extends StatelessWidget {
  Artist artist;
  AlbumScreenView({Key? key, required this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(artist.name)),
        body: SingleChildScrollView(
            child: AlbumGridView(artistId: artist.id.toString())));
  }
}


class AlbumGridView extends StatelessWidget {
  String artistId;
  late AlbumBloc bloc ;
  AlbumGridView({required this.artistId});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: AlbumBloc()..add(DioGet(query: artistId)),
        builder: (context, state) {
          if (state is DioLoadingState) {
            return const Center(
                child:
                    SizedBox(height: 40, child: CircularProgressIndicator()));
          } else if (state is DioLoadedState) {
            return GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.data.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: MediaQuery.of(context).size.width / 2),
                itemBuilder: (context, index) {
                  return AlbumCardView(album: state.data.elementAt(index));
                });
          } else {
            return Text("");
          }
        });
  }
}

class AlbumCardView extends StatelessWidget {
  Album album;
  AlbumCardView({required this.album});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Expanded(child: Image.network(album.cover, fit: BoxFit.cover)),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Text(album.title,
                        style: const TextStyle(fontWeight: FontWeight.bold)))
              ],
            )));
  }
}
