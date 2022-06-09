import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/genre.dart';
import '../utils/dioclient.dart';
import '../utils/response_state.dart';
class GenreViewBloc extends Bloc<DioEvent,DioState>{
  GenreViewBloc() : super(DioInitialState()){
    DioClient dioClient = DioClient();
    on<DioGet>((event,emit) async{
      emit(DioLoadingState());
      try{
        List<Genre> genreList = await dioClient.getAllGenre();
        emit(DioLoadedState(data: genreList));
      }
      catch (e){
        emit(DioErrorState(error: 'Something wrong'));
      }
    });
  }
}