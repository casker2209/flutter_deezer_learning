import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  SearchAppBar() : preferredSize = Size.fromHeight(kToolbarHeight);
  @override
  final Size preferredSize;

  @override
  State<StatefulWidget> createState() => _SearchAppBarState();
}
class _SearchAppBarState extends State<SearchAppBar>{
  late TextEditingController textEditingController;
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
      return AppBar(title: Text(""));
  }

}