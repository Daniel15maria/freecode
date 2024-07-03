import 'package:flutter/material.dart';

class alert extends StatefulWidget {
  const alert({super.key});

  @override
  State<alert> createState() => _alertState();
}

class _alertState extends State<alert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AlertBox"),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          child: Center(
            child: TextButton(
              onPressed: () {
                _showMyDialog(context);
                print('Button pressed');
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.dangerous),
                  SizedBox(height: 4), // Space between icon and text
                  Text(
                    'Dangerous',
                    style: TextStyle(fontSize: 12), // Reduce the text size
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text("This is Dangerous"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [Text("so dont prees it"), Text("dont do it agaian")],
            ),
          ),
          actions: [
            TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: (Icon(Icons.close)),
                label: Text("Close")),
            TextButton.icon(
                onPressed: () {},
                icon: (Icon(Icons.approval)),
                label: Text("accept"))
          ],
        );
      });
}
