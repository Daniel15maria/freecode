import 'package:flutter/material.dart';
import 'package:freecode/Tabbar.dart';
import 'package:freecode/image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navrail(),
    );
  }
}

class Navrail extends StatefulWidget {
  const Navrail({Key? key}) : super(key: key);

  @override
  _NavrailState createState() => _NavrailState();
}

class _NavrailState extends State<Navrail> {
  late int _selectedIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appBarTitle(),
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      children: [
                        TabbarWidget(),
                        image(),
                        SnackBarWidget(),
                        DismissableListWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            VerticalDivider(thickness: 1, width: 1),
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _onNavItemTapped,
              labelType: NavigationRailLabelType.selected,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  selectedIcon: Icon(Icons.home, color: Colors.green),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.search),
                  selectedIcon: Icon(Icons.search, color: Colors.green),
                  label: Text('Search'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.add),
                  selectedIcon: Icon(Icons.add, color: Colors.green),
                  label: Text('Add'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.paste),
                  selectedIcon: Icon(Icons.paste, color: Colors.green),
                  label: Text('Paste'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBarTitle() {
    switch (_selectedIndex) {
      case 0:
        return Text('Drawer Page');
      case 1:
        return Text('Image Page');
      case 2:
        return Text('SnackBar Page');
      case 3:
        return Text('Dismissable List Page');
      default:
        return Text('App Bar Title');
    }
  }
}

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Drawer Page Content'),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Image Page Content'),
      ),
    );
  }
}

class SnackBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('SnackBar Page Content'),
      ),
    );
  }
}

class DismissableListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Dismissable List Page Content'),
      ),
    );
  }
}
