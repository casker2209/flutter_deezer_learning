import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/album.dart';
import '../model/artist.dart';
import '../model/song.dart';
import '../utils/dioclient.dart';
import '../utils/response_state.dart';

class SearchBloc extends Bloc<DioEvent,DioState>{
  SearchBloc() : super(DioInitialState()){
    DioClient dioClient = DioClient();
    on<DioGet>((event,emit) async{
      if(event.query!.isNotEmpty){
        emit(DioLoadingState());
        try{
          List<Song> songList = await dioClient.getSongByQuery(query: event.query!);
          List<Album> albumList = await dioClient.getAlbumByQuery(query: event.query!);
          List<Artist> artistList = await dioClient.getArtistByQuery(query: event.query!);
          emit(DioLoadedState(data: {
            "song":songList,
            "album":albumList,
            "artist":artistList
          }));
        }
        catch (e){
          print("Error here"+ e.toString());
          emit(DioErrorState(error: 'Something wrong'));
        }
      }
    });
  }

}