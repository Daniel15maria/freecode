import 'package:flutter/material.dart';
import 'package:freecode/Location.dart';
import 'package:freecode/Main_grid.dart';
import 'package:freecode/Tabbar.dart';
import 'package:freecode/alert.dart';
import 'package:freecode/botttomnavbar.dart';
import 'package:freecode/dismisable.dart';
import 'package:freecode/drawer.dart';
import 'package:freecode/dropdown.dart';
import 'package:freecode/form.dart';
import 'package:freecode/image.dart';
import 'package:freecode/imagepicker.dart';
import 'package:freecode/list_grid.dart';
import 'package:freecode/navrail.dart';
import 'package:freecode/row.dart';
import 'package:freecode/sideNav.dart';
import 'package:freecode/snack_bar.dart';
import 'package:freecode/stack.dart';
import 'package:freecode/visacad.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light, primaryColor: Colors.grey),
      home: Navrail(),
    );
  }
}
