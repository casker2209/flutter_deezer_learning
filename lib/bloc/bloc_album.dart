import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/album.dart';
import '../utils/dioclient.dart';
import '../utils/response_state.dart';

class AlbumBloc extends Bloc<DioEvent, DioState> {
  AlbumBloc() : super(DioInitialState()) {
    DioClient dioClient = DioClient();
    on<DioGet>((event, emit) async {
      emit(DioLoadingState());
      try {
        List<Album> albumList =
        await dioClient.getAlbumByArtistId(artistId: event.query!);
        emit(DioLoadedState(data: albumList));
      } catch (e) {
        print(e);
        emit(DioErrorState(error: "Try again"));
      }
    });
  }
}