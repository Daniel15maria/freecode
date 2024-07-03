import 'package:flutter/material.dart';
import 'package:freecode/image.dart';

class visacard extends StatefulWidget {
  const visacard({super.key});

  @override
  State<visacard> createState() => _VisaCardState();
}

class _VisaCardState extends State<visacard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 133, 204, 135),
      body: Center(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 350,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Content(),
            ),
          ),
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            right: -150,
            child: Container(
              height: 350,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: -150,
            bottom: -470,
            child: Container(
              height: 600,
              width: 750,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 20,
              left: 15,
              child: Container(
                  height: 30,
                  child: Container(
                    height: 30,
                    child: Image.asset('assets/logo.png'),
                  )))
          // Add other positioned elements as needed
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: visacard()));
