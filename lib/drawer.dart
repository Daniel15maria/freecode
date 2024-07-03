import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Container(
            color: Theme.of(context).primaryColor,
            child: ListView(
              children: [
                DrawerHeader(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      color: Colors.black,
                      padding: EdgeInsets.all(9.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 55,
                            backgroundImage: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt-9AkM5cZgv9UwZ22rg_tSMCTbJXFMbCM7w&s'),
                          ),
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "AMbel Bruce",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text("ass.proff")
                            ],
                          )
                        ],
                      ),
                    )),
                ListTile(
                  leading: Icon(Icons.folder),
                  title: Text("Folders"),
                ),
                ListTile(
                  leading: Icon(Icons.alarm),
                  title: Text("alarm"),
                ),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text("Delete"),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Logout"),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text("Drawer"),
        ),
        body: Container(
          child: Center(child: Text("het there")),
        ));
  }
}
