import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class row extends StatelessWidget {
  const row({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Row"),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(8.0)),
                  overlayColor: MaterialStateProperty.all(Colors.black),
                  elevation: MaterialStateProperty.all(10),
                  backgroundColor: MaterialStateProperty.all(Colors.yellow)),
              onPressed: () {
                print('like');
              },
              child: Text(
                "click me",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            )
          ]),
        ));
  }
}
