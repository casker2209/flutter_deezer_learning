import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deezer_learning/screen/screen_artist.dart';
import 'package:flutter_deezer_learning/screen/screen_genre.dart';
import 'package:flutter_deezer_learning/screen/screen_search.dart';
import 'package:flutter_deezer_learning/utils/dioclient.dart';
import 'package:flutter_deezer_learning/utils/network_service.dart';
import 'package:flutter_deezer_learning/utils/response_state.dart';
import 'package:flutter_deezer_learning/widget/home_screen_title.dart';
import 'model/genre.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:build_daemon/change_provider.dart';
class HomeView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

abstract class NavBarState {
  int getIndex();
  String getTitle();
}

class BrowseState extends NavBarState{


  getIndex() => 0;
  getTitle() => "Searching";
}

class UserState extends NavBarState{
  getIndex() => 1;
  getTitle() => "User";
}
class NavBarCubit extends Cubit<NavBarState>{
  NavBarCubit() : super(BrowseState());

  void onIndexChange(int i){
    emit(i == 0 ? BrowseState() : UserState());
  }
}


class HomeState extends State<HomeView>{
  final DioClient dioClient = DioClient();
  late NavBarCubit _navBarCubit;
  @override
  void initState() {
    _navBarCubit = NavBarCubit();
    super.initState();
  }
  @override
  void dispose() {
    _navBarCubit.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocBuilder(
            bloc: _navBarCubit,
            builder: (context,state) => Scaffold(
          appBar:AppBar(
            title: Text(_navBarCubit.state.getTitle()),actions: [_navBarCubit.state.getIndex() == 0 ? IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
          }, icon: Icon(Icons.search)) : Container() ],
          ),
          body: _navBarCubit.state.getIndex() == 0 ? BrowseHomeView() : UserHomeView(),
          bottomNavigationBar: BottomNavigationBar(items: [
            BottomNavigationBarItem(icon: Icon(Icons.search),label:"Searching"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "User")],
            onTap: (index) => _navBarCubit.onIndexChange(index),currentIndex: (state as NavBarState).getIndex(),
            selectedItemColor: Colors.lightBlue,
            unselectedItemColor: Colors.grey,
          ),
        )));
  }
}







class SearchHomeView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SearchScreen();
  }
}

class UserHomeView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold();
  }
}