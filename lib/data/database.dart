import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{

  List toDoList = [];
  final _mybox= Hive.box('mybox');

  void createInitialData(){
    toDoList =[
      ["Make Tutorial",false],
      ["Drink Coffee",false],
    ];
  }

  void loadData(){
    toDoList = _mybox.get("TODOLIST");

  }

  void updateDataBase(){
    _mybox.put("TODOLIST", toDoList);

  }

}