import 'package:flutter/material.dart';
import 'package:todo_list/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  DialogBox({super.key,required this.controller,required this.onSave,required this.onCancel});

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,

      content: Container(height: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: controller ,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a New Task"),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(text: "Save", onPressed: onSave),

              SizedBox(width: 7,),
              MyButton(text: "Cancel", onPressed: onCancel),
            ],
          )
        ],
      ),



      ),
    );
  }
}
