import 'package:flutter/material.dart';

class bottom extends StatefulWidget {
  const bottom({super.key});

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomSheet"),
        backgroundColor: Colors.amber.shade100,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: Theme.of(context).primaryColor,
                  isDismissible: false,
                  enableDrag: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text("Orange"),
                          subtitle: Text("Karan"),
                        ),
                        ListTile(
                          title: Text("Apple"),
                          subtitle: Text("Kannan"),
                        ),
                        ListTile(
                          title: Text("Lemon"),
                          subtitle: Text("Kushi"),
                        ),
                        ListTile(
                          title: Text("Bannana"),
                          subtitle: Text("Dani"),
                        ),
                        ListTile(
                          title: Text("Redvelvet"),
                          subtitle: Text("Chandru"),
                        )
                      ],
                    );
                  });
            },
            child: Text("Bottom Sheet")),
      ),
    );
  }
}
