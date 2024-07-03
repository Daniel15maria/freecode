import 'package:flutter/material.dart';

class list_grid extends StatefulWidget {
  const list_grid({super.key});

  @override
  State<list_grid> createState() => _list_gridState();
}

class _list_gridState extends State<list_grid> {
  List<String> names = ['dani', 'rahu', 'diso', 'vhandru', 'methu'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "list",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 124, 10, 10),
        elevation: 10,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(names[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
