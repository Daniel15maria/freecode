import 'package:flutter/material.dart';

class snack_bar extends StatelessWidget {
  const snack_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SnackBar")),
      body: Center(
        child: Container(
          child: ElevatedButton(
            onPressed: () {
              final Snackbar = SnackBar(
                  action: SnackBarAction(label: 'close', onPressed: () {}),
                  behavior: SnackBarBehavior.floating,
                  content: Text("youy are alerrted"));
              ScaffoldMessenger.of(context).showSnackBar(Snackbar);
            },
            child: Text("snack"),
          ),
        ),
      ),
    );
  }
}
