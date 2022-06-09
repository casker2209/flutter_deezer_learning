import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deezer_learning/screen/screen_artist.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc_genre.dart';
import '../model/genre.dart';
import '../utils/dioclient.dart';
import '../utils/response_state.dart';

class BrowseHomeView extends StatelessWidget{
  final DioClient dioClient = DioClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:(SingleChildScrollView(child: BrowseGenreGridView()))
    );
  }
}

class GenreCardView extends StatelessWidget{
  GenreCardView({Key? key, required this.genre}) : super(key: key);
  Genre genre;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ArtistScreenView(genre: genre)));
        },
        child:Card(
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                Expanded(child: Image.network(genre.picture, fit: BoxFit.cover)),
                Padding(padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Text(genre.name,style: const TextStyle(fontWeight: FontWeight.bold)))],
            )
        ));
  }

}
class BrowseGenreGridView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _BrowseGenreGridViewState();
  }

}

class _BrowseGenreGridViewState extends State<BrowseGenreGridView>{
  late GenreViewBloc bloc;
  @override
  void initState() {
    bloc = GenreViewBloc()..add(DioGet());
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
        builder: (context,state) {
          if(state is DioInitialState) {
            return const Text("");
          } else if(state is DioLoadingState) {
            return const Center(child:SizedBox(height:40,child:CircularProgressIndicator()));
          } else if(state is DioLoadedState) {
            return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.data.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: MediaQuery.of(context).size.width/2),
                itemBuilder: (context,index){
                  return GenreCardView(genre: state.data.elementAt(index));
                });
          } else {
            return const Text('No Data');
          }
        });
  }
}