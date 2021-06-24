import 'package:flutter/material.dart';

class TaskStatus extends StatefulWidget {
  const TaskStatus({Key? key}) : super(key: key);

  @override
  State<TaskStatus> createState() => _TaskStatusState();
}

class _TaskStatusState extends State<TaskStatus> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: isChecked ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(5.0)),
              width: 10,
              height: 10,
              child: Icon(
                Icons.check,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}