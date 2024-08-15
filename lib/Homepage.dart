import 'package:flutter/material.dart';
import 'package:todo_list/utils/todo_List.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();
  List toDoList=[
    ['WakeUp at 6am',false],
    ['Drink Coffee',false],
    ['Read books',false],
    ['Sleep',true]
  ];

  void checkBoxChanged(int index){
   setState(() {
     toDoList[index][1]= !toDoList[index][1];
   });
  }

  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text,false],);
      _controller.clear();
    });
  }

  void deleteTask(int index){
    setState(() {
      toDoList.remove(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(title: Text(
          'ToDo List',),
      backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
      ),
      body: Body(),
      floatingActionButton: Row(
        children: [
          Expanded(child:
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Add a new todo items',
                filled: true,
                fillColor: Colors.deepPurple.shade200,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),

                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          )
    ),
          FloatingActionButton(
            onPressed: saveNewTask,
            child: Icon(Icons.add),

          ),
        ],
      ),
    ));
  }
  
  
  Widget Body(){
    return Container(
      child: ListView.builder(
          itemCount: toDoList.length,itemBuilder: (BuildContext context,index){
      return ToDoList(
        taskName: toDoList[index][0],
        taskCompleted: toDoList[index][1],

        onChanged: (value) => checkBoxChanged(index),
        deleteFunction: (value)=> deleteTask(index),

      );
    }), );
  }
  
}
