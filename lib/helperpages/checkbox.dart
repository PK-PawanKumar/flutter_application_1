import 'package:flutter/material.dart';

class ListCheckBox extends StatefulWidget {
  const ListCheckBox({Key? key}) : super(key: key);

  @override
  State<ListCheckBox> createState() => _ListCheckBoxState();
}

class _ListCheckBoxState extends State<ListCheckBox> {
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
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          children: [
            Text(
              "Allow Notification  ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              decoration: BoxDecoration(
                  color: isChecked ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(5.0)),
              width: 30,
              height: 30,
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
