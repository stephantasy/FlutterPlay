import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/models/doto.dart';
import 'package:hello_flutter/utils/db_helper.dart';
import 'package:intl/intl.dart';

const menuSave = 'Save Todo & Back';
const menuDelete = 'Delete Todo';
const menuBack = 'Back to List';
final List<String> choises = const <String>[menuSave, menuDelete, menuBack];

class TodoDetail extends StatefulWidget {
  final Todo todo;

  TodoDetail(this.todo);

  @override
  State<StatefulWidget> createState() => TodoDetailState(todo);
}

class TodoDetailState extends State {
  Todo todo;
  final _priorities = ["High", "Medium", "Low"];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final double _formDistance = 10.0;
  DbHelper dbHelper = DbHelper();

  TodoDetailState(this.todo);

  Widget build(BuildContext context) {
    titleController.text = todo.title;
    descriptionController.text = todo.description;

    return WillPopScope(  // Disable back button
      onWillPop: () async => true, // To disable back button : set async to false
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(todo.title),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: select,
              itemBuilder: (BuildContext context) {
                return choises.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: _formDistance,
                      bottom: _formDistance,
                    ),
                    child: genericTextField(
                        titleController, "Title", "Write a title", updateTitle),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: _formDistance,
                      bottom: _formDistance,
                    ),
                    child: genericTextField(descriptionController,
                        "Description", "Write a description", updateDesc),
                  ),
                  ListTile(title: myDropDown()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void select(String value) async {
    switch (value) {
      case menuSave:
        save();
        break;
      case menuDelete:
        Navigator.pop(context, true);
        delete();
        break;
      default:
        Navigator.pop(context, true);
    }
  }

  Future<int> delete() async {
    if (todo.id == null) {
      return -1;
    }
    int result = await dbHelper.deleteTodo(todo.id);
    if (result != 0) {
      AlertDialog alertDialog = AlertDialog(
        title: Text("Delete Todo"),
        content: Text("The todo has been deleted!"),
      );
      showDialog(context: context, builder: (_) => alertDialog);
    }
    return result;
  }

  void save() {
    todo.date = DateFormat.yMd().format(DateTime.now());
    if (todo.id != null) {
      dbHelper.updateTodo(todo);
    } else {
      dbHelper.insertTodo(todo);
    }
    Navigator.pop(context, true);
  }

  void updatePriority(String value) {
    switch (value) {
      case "High":
        todo.priority = 1;
        break;
      case "Medium":
        todo.priority = 2;
        break;
      case "Low":
        todo.priority = 3;
        break;
    }
    setState(() {
    });
  }

  String retrievePriority(int value) {
    return _priorities[value - 1];
  }

  void updateTitle() {
    todo.title = titleController.text;
  }

  void updateDesc() {
    todo.description = descriptionController.text;
  }

  TextField genericTextField(
      TextEditingController controller, String title, String hint, callback) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return TextField(
      controller: controller,
      onChanged: (value) => callback(),
      decoration: InputDecoration(
        labelText: title,
        hintText: hint,
        labelStyle: textStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }

  DropdownButton<String> myDropDown() {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return DropdownButton<String>(
      items: _priorities.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      style: textStyle,
      value: retrievePriority(todo.priority),
      onChanged: (value) => updatePriority(value),
    );
  }
}
