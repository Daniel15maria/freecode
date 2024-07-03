import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class image extends StatefulWidget {
  const image({super.key});

  @override
  State<image> createState() => _imageState();
}

class _imageState extends State<image> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: 200,
        width: 250,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 5)
            ],
            image: DecorationImage(
              image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeMH4Q261y6PcFIMJy-rdWpw1UT_eMCpH9Nw&s',
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20)),
      ),
    ));
  }
}
