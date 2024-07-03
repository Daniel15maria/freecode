import 'package:flutter/material.dart';
import 'package:freecode/dismisable.dart';
import 'package:freecode/drawer.dart';
import 'package:freecode/image.dart';
import 'package:freecode/snack_bar.dart';

class SideNav extends StatefulWidget {
  const SideNav({super.key});

  @override
  State<SideNav> createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  int selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: [drawer(), image(), snack_bar(), DismissableList()],
            ),
          ),
          Container(
            width: 80,
            height: 350,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.home,
                          color:
                              selectedIndex == 0 ? Colors.green : Colors.grey),
                      onPressed: () => onTapped(0),
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: selectedIndex == 0 ? Colors.green : Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.search,
                          color:
                              selectedIndex == 1 ? Colors.green : Colors.grey),
                      onPressed: () => onTapped(1),
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: selectedIndex == 1 ? Colors.green : Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.add,
                          color:
                              selectedIndex == 2 ? Colors.green : Colors.grey),
                      onPressed: () => onTapped(2),
                    ),
                    Text(
                      'Add',
                      style: TextStyle(
                        color: selectedIndex == 2 ? Colors.green : Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.paste,
                          color:
                              selectedIndex == 3 ? Colors.green : Colors.grey),
                      onPressed: () => onTapped(3),
                    ),
                    Text(
                      'paste',
                      style: TextStyle(
                        color: selectedIndex == 3 ? Colors.green : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
