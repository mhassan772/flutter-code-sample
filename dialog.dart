showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Deleting Todo"),
          content: new Text('Are you sure you want to delete "${task.text}" '),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () => Navigator.of(context).pop()
            ),
            new FlatButton(
                child: new Text('DELETE'),
                onPressed: () {
                  _removeTodoItem(task);
                  Navigator.of(context).pop();
                }
            ),
          ],
        );
      },
    );
    
    // You put this in the state class "class TodoListState extends State<TodoList>"
