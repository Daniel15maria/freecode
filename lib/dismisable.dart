import 'package:flutter/material.dart';

class DismissableList extends StatefulWidget {
  const DismissableList({super.key});

  @override
  State<DismissableList> createState() => _DismissableListState();
}

class _DismissableListState extends State<DismissableList> {
  List<String> names = ['dani', 'duso', 'india', 'hii'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissable"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) {
            final name = names[index];
            return Dismissible(
              key: Key(name),
              onDismissed: (direction) {
                setState(() {
                  names.removeAt(index);
                });

                if (direction == DismissDirection.startToEnd) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("$name dismissed from start to end"),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("$name dismissed from end to start"),
                    ),
                  );
                }
              },
              background: Container(color: Colors.red),
              secondaryBackground: Container(color: Colors.green),
              child: ListTile(
                title: Text(name),
              ),
            );
          },
        ),
      ),
    );
  }
}
