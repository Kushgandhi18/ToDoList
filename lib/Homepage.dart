import 'package:flutter/material.dart';
import 'package:todo_list/data/database.dart';
import 'package:todo_list/utils/dialog_box.dart';
import 'package:todo_list/utils/todo_List.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _mybox= Hive.box('mybox');
  final _controller = TextEditingController();

  ToDoDatabase db= ToDoDatabase();

  void initState(){

    if(_mybox.get("TODOLIST")== null){
      db.createInitialData();
    }else{
      db.loadData();
    }

    super.initState();
  }

  void checkBoxChanged(int index){
   setState(() {
     db.toDoList[index][1]= !db.toDoList[index][1];
   });
   db.updateDataBase();
  }

  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();

    });
    Navigator.of(context).pop();
  }

  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask ,
        onCancel: () => Navigator.of(context).pop(),);
      },
    );
  }

  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);

    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(title: Text(
          'ToDo List',
      textAlign: TextAlign.center,),
      backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Body(),
      floatingActionButton: Row(
        children: [
          Expanded(child:
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),

          )
    ),
          FloatingActionButton(
            onPressed: createNewTask,
            child: Icon(Icons.add),

          ),
        ],
      ),
    ));
  }
  
  
  Widget Body(){
    return Container(
      child: ListView.builder(
          itemCount: db.toDoList.length,itemBuilder: (BuildContext context,index){
      return ToDoList(
        taskName: db.toDoList[index][0],
        taskCompleted: db.toDoList[index][1],

        onChanged: (value) => checkBoxChanged(index),
        deleteFunction: (context) => deleteTask(index),

      );
    }), );
  }
  
}
