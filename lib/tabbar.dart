import 'package:flutter/material.dart';
import 'package:freecode/inventory.dart';

class TabbarWidget extends StatelessWidget {
  const TabbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 179, 226, 181),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20), // Set the desired height here
            child: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.chat),
                  text: 'CHATS',
                ),
                Tab(
                  icon: Icon(Icons.group_add_rounded),
                  text: 'GROUPS',
                ),
                Tab(
                  icon: Icon(Icons.call),
                  text: 'CALL HISTORY',
                ),
                Tab(
                  icon: Icon(Icons.browse_gallery),
                  text: 'Gallery',
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
            children: [Inventory(), Inventory(), Inventory(), Inventory()]),
      ),
    );
  }
}
