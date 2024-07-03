import 'package:flutter/material.dart';

class location extends StatefulWidget {
  const location({super.key});

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loaction"),
      ),
      body: Column(
        children: [
          Text(
            'Location',
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(onPressed: () {}, child: Text('GEt Loacation'))
        ],
      ),
    );
  }
}
