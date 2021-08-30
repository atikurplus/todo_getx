import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';

class TodoEdit extends StatelessWidget {
  final int? index;
  TodoEdit({@required this.index});
  final TodoController todoController = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =
        TextEditingController(text: todoController.todos[index!].text);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                // textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "What do you want to accomplish?",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                autofocus: true,
                controller: textEditingController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ignore: deprecated_member_use
                RaisedButton(
                  child: Text('Cancle'),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {
                    Get.back();
                  },
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  child: Text('Update'),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    var editing = todoController.todos[index!];
                    editing.text = textEditingController.text;
                    todoController.todos[index!] = editing;
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
