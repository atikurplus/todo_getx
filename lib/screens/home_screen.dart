import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/main.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/screens/edit_todo.dart';
import 'package:todo_getx/screens/todo_screen.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/Home_screen';
  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Get.toNamed(TodoScreen.id);
        },
      ),
      body: Container(
        child: Obx(
          () => ListView.builder(
            itemBuilder: (context, index) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.deepOrange,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              onDismissed: (_) {
                todoController.todos.removeAt(index);
                Get.snackbar('Remove!', "Task was succesfully Delete",
                    snackPosition: SnackPosition.BOTTOM);
              },
              child: ListTile(
                title: Text(
                  todoController.todos[index].text!,
                  style: todoController.todos[index].done
                      ? TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                        )
                      : TextStyle(
                          color: Colors.black,
                        ),
                ),
                trailing: IconButton(
                  onPressed: () => Get.to(() => TodoEdit(index: index)),
                  icon: Icon(Icons.edit),
                ),
                leading: Checkbox(
                  value: todoController.todos[index].done,
                  onChanged: (neWvalue) {
                    var todo = todoController.todos[index];
                    todo.done = neWvalue!;
                    todoController.todos[index] = todo;
                  },
                ),
              ),
            ),
            itemCount: todoController.todos.length,
          ),
        ),
      ),
    );
  }
}
