import 'package:flutter/widgets.dart';

class Data with ChangeNotifier{
  String title;
  String subTitle;
  bool selected;

  Data({
    @required this.title,
    @required this.subTitle,
    this.selected = false,
  });

  
  select(){
    selected =!selected;
    notifyListeners();
  }
}