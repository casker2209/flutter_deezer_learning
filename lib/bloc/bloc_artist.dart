import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/artist.dart';
import '../utils/dioclient.dart';
import '../utils/response_state.dart';

class ArtistBloc extends Bloc<DioEvent, DioState> {
  ArtistBloc() : super(DioInitialState()) {
    DioClient dioClient = DioClient();
    on<DioGet>((event, emit) async {
      emit(DioLoadingState());
      try {
        List<Artist> artistList =
        await dioClient.getArtistByGenreId(genreId: event.query!);
        emit(DioLoadedState<List<Artist>>(data: artistList));
      } catch (e) {
        print(e);
        emit(DioErrorState(error: "Try again"));
      }
    });
  }
}