import 'package:flutter/material.dart';

class MainGrid extends StatefulWidget {
  const MainGrid({Key? key}) : super(key: key);

  @override
  State<MainGrid> createState() => _MainGridState();
}

class _MainGridState extends State<MainGrid> {
  Map<String, List<String>> namePosition = {
    'names': ['dani', 'chandru', 'praveen', 'don'],
    'position': ['kitchen', 'hall', 'room', 'restroom'],
    'images': [
      'assets/images/dani.png',
      'assets/images/chandru.png',
      'assets/images/praveen.png',
      'assets/images/don.png'
    ], // Add your image paths here
    'prices': ['10', '20', '30', '40'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: GridView.builder(
          itemCount: namePosition['names']?.length ?? 0,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    namePosition['names']?[index] ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Image.asset(
                    namePosition['images']?[index] ??
                        'assets/images/placeholder.png', // Use a placeholder image
                    height: 100,
                  ),
                  Text(
                    '₹${namePosition['prices']?[index] ?? '0'}',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    color: Colors.blue,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
