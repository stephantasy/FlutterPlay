import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_flutter/models/doto.dart';
import 'package:hello_flutter/screens/todo_detail.dart';
import 'package:hello_flutter/utils/db_helper.dart';

class ToDoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  DbHelper dbHelper = DbHelper();
  List<Todo> todos;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // Fill Database
    //fillDb();
    //clearDb();

    // GetData
    if (todos == null) {
      todos = List<Todo>();
      getData();

      if (todos.length <= 0) {
        //fillDb();
        //getData();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        backgroundColor: Colors.blueAccent,
      ),
      body: todoListItems(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToDetail(Todo("", "", 1)),
        tooltip: "Add new Todo",
        child: Icon(Icons.add),
      ),
    );
  }

  ListView todoListItems() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: getColor(this.todos[position].priority),
                child: Text(this.todos[position].id.toString()),
              ),
              title: Text(this.todos[position].title),
              subtitle: Text(this.todos[position].date),
              onTap: () {
                navigateToDetail(this.todos[position]);
                debugPrint("Tapped on " + this.todos[position].id.toString());
              },
            ),
          );
        });
  }

  Color getColor(int value) {
    switch (value) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;
      case 3:
        return Colors.green;
        break;
      default:
        return Colors.white;
    }
  }

  void navigateToDetail(Todo todo) async {
    bool result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TodoDetail(todo)),
    );
    //if (result == true) {
    getData();
    //}
  }

  // Fetch Data from Database
  void getData() {
    final dbFuture = dbHelper.initializeDb();
    // We use "then" because we wait the DB to be ready
    dbFuture.then((result) {
      final todosFuture = dbHelper.getTodos();
      todosFuture.then((result) {
        List<Todo> todoList = List<Todo>();
        count = result.length;
        for (int i = 0; i < count; i++) {
          todoList.add(Todo.fromObject(result[i]));
          debugPrint(" - " + todoList[i].title);
        }
        setState(() {
          todos = todoList;
          count = count;
        });
        debugPrint("Items " + count.toString());
      });
    });
  }

  // Fill Database for tests
  void fillDb() {
    DbHelper dbHelper = DbHelper();
    dbHelper
        .initializeDb()
        .then((result) => dbHelper.getTodos().then((result) => todos = result));
    DateTime today = DateTime.now();
    Todo todo;
    // 1
    todo = Todo("Buy Apples", today.toString(), 1, "Comment 1");
    dbHelper.insertTodo(todo);
    // 2
    todo = Todo("Buy Oranges", today.toString(), 2, "Comment 2");
    dbHelper.insertTodo(todo);
    // 3
    todo = Todo("Buy Melon", today.toString(), 3, "Comment 3");
    dbHelper.insertTodo(todo);
  }

  // Clear the BD
  clearDb() {
    DbHelper dbHelper = DbHelper();
    dbHelper.deleteAll();
  }
}
