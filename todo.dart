// Import MaterialApp and other widgets which we can use to quickly create a material app
import 'package:flutter/material.dart';

void main() => runApp(new TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'Todo List', home: new TodoList());
  }
}

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class ToDo{
  String text;
  bool checked = false;
  int index;
  ToDo(String text, int index){
    this.text = text;
    this.index = index;
  }
  void check(){
    if(checked){
      checked = false;
    }else{
      checked = true;
    }
  }
}

class TodoListState extends State<TodoList> {
  List <ToDo> _todoItems = [];

  void _addTodoItem(String task) {
    setState(() {
      int index = _todoItems.length;
      ToDo taskClass = new ToDo(task, index);
      _todoItems.add(taskClass);
    });
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        // itemBuilder will be automatically be called as many times as it takes for the
        // list to fill up its available space, which is most likely more than the
        // number of todo items we have. So, we need to check the index is OK.
        if (index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index]);
        }
      },
    );
  }

  Widget _buildTodoItem(ToDo newTodo) {
    if (newTodo.checked){
      return new Row(children: <Widget>[IconButton(
          icon: Icon(Icons.check_box, size: 30.0),
          onPressed: (){setState(() {newTodo.check();});}
      ),new SizedBox(width: 10),new Text(newTodo.text), Expanded(child: SizedBox()),
    IconButton(
    icon: Icon(Icons.delete, size: 30.0),
    onPressed: (){setState(() {_todoItems.remove(newTodo);});}
    )
      ]
      );
    }else{
      return new Row(children: <Widget>[IconButton(
          icon: Icon(Icons.check_box_outline_blank, size: 30.0),
          onPressed: (){setState(() {newTodo.check();});}
      ),new SizedBox(width: 10),new Text(newTodo.text), Expanded(child: SizedBox()),
        IconButton(
          icon: Icon(Icons.delete, size: 30.0),
          onPressed: (){setState(() {_todoItems.remove(newTodo);});}
      )
      ]
      );
    }

    //return new ListTile(title: new Text(newTodo));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('Todo List')),
        body: _buildTodoList(),
        floatingActionButton: FloatingActionButton(
          onPressed: _pushAddTodoScreen,
          child: Icon(Icons.add),
        ));
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(title: new Text('Add Todo')),
          body: new TextField(autofocus: true, onSubmitted: (val){_addTodoItem(val);Navigator.pop(context);}));
    }));
  }
}
