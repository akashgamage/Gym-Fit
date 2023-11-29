import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MySupplementsPage extends StatefulWidget {
  const MySupplementsPage({Key? key}) : super(key: key);

  @override
  _MySupplementsPageState createState() => _MySupplementsPageState();
}

class _MySupplementsPageState extends State<MySupplementsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF944653), Color(0xFF434B63)],
          ),
        ),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 0),
              child: Image.asset('assets/Card 2.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TodoList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 208, 253, 62),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return AddTodoDialog();
                },
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("MyTodos").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator(
            color: Color.fromARGB(255, 21, 165, 105),
          );
        }

        final todos = snapshot.data!.docs;

        return ListView.builder(
          shrinkWrap: true,
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            final todo = todos[index];
            final taskTitle = todo['title'];
            final taskDescription = todo['description'];
            final taskDate = todo['date'] != null
                ? (todo['date'] as Timestamp).toDate().toLocal()
                : null;
            final taskTime = todo['time'];

            return Dismissible(
              key: Key(index.toString()),
              onDismissed: (direction) {
                FirebaseFirestore.instance
                    .collection("MyTodos")
                    .doc(todo.id)
                    .delete();
              },
              child: Card(
                color: Color.fromARGB(255, 58, 58, 58),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    title: Text(
                      taskTitle,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(taskDescription,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              )),
                          SizedBox(height: 8),
                          if (taskDate != null)
                            Text(
                              "Date: $taskDate",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          SizedBox(height: 8),
                          if (taskTime != null)
                            Text("Time: $taskTime",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                )),
                        ],
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection("MyTodos")
                            .doc(todo.id)
                            .delete();
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class AddTodoDialog extends StatefulWidget {
  @override
  _AddTodoDialogState createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  String title = "";
  String description = "";
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text("Add Supplements"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
              hintText: "Enter Title",
            ),
            onChanged: (value) {
              setState(() {
                title = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Description',
              hintText: "Enter Description",
            ),
            onChanged: (value) {
              setState(() {
                description = value;
              });
            },
          ),
          ElevatedButton(
            onPressed: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                setState(() {
                  selectedDate = pickedDate;
                });
              }
            },
            child: Text("Select Date"),
          ),
          ElevatedButton(
            onPressed: () async {
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (pickedTime != null) {
                setState(() {
                  selectedTime = pickedTime;
                });
              }
            },
            child: Text("Select Time"),
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
          onPressed: () {
            if (title.isNotEmpty && description.isNotEmpty) {
              FirebaseFirestore.instance.collection("MyTodos").add({
                "title": title,
                "description": description,
                "date": selectedDate,
                "time":
                    selectedTime != null ? selectedTime?.format(context) : null,
              });
              Navigator.pop(context);
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Error"),
                    content: Text("Both title and description are required."),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("OK"),
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: Text("Add"),
        ),
      ],
    );
  }
}
