import 'package:flutter/material.dart';
import 'package:taskwithprovider/data/data.dart';

class DataProvider with ChangeNotifier {
  List<Data> _list = [];
  DataProvider() {
    _list = [
      Data(
        title: "name1",
        subTitle: "abc1",
      ),
      Data(
        title: "name2",
        subTitle: "abc2",
      ),
      Data(
        title: "name3",
        subTitle: "abc3",
      ),
      Data(
        title: "name4",
        subTitle: "abc4",
      ),
      Data(
        title: "name5",
        subTitle: "abc5",
      ),
    ];
  }

  List<Data> get list {
    return [..._list];
  }
  bool alltrue(){
    for(var i=0;i<_list.length;i++){
    if(!_list[i].selected){
      return false;
    }
    }
    return true;
  }

  selectall(){
    if(alltrue()){
    for(var i=0;i<_list.length;i++){
    _list[i].selected = false;
    }}
    else{
      for(var i=0;i<_list.length;i++){
    _list[i].selected = true;
    }
    }
    notifyListeners();
  }
}
