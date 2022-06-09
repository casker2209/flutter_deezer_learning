import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class DioState<T>{

}

class DioLoadingState<T> extends DioState<T>{
}

class DioInitialState<T> extends DioState<T>{
}

class DioLoadedState<T> extends DioState<T>{
  T data;
  DioLoadedState({required this.data});
}
class DioErrorState extends DioState{
  String error;
  DioErrorState({required this.error});
}
abstract class DioEvent{
}

class DioGet extends DioEvent{
  String? query;
  DioGet({this.query});
}
