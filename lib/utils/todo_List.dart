import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  ToDoList({super.key, required this.taskName, required this.taskCompleted,required this.onChanged,required this.deleteFunction});
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  Function(BuildContext)? deleteFunction;


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 0,
        ),
        child: Slidable(
          endActionPane: ActionPane(
              motion: StretchMotion(), children: [
            SlidableAction(onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor:Colors.red.shade300,
            borderRadius: BorderRadius.circular(14),)
          ]),
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Checkbox(value: taskCompleted,
                  onChanged: onChanged,
                  checkColor: Colors.white,
                  activeColor: Colors.black,
                  side: BorderSide(color: Colors.white),
          
                ),
                Text(
                  taskName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.white,
                    decorationThickness: 3,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
