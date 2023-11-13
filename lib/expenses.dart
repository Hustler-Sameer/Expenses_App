import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key}); // constructor function

  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Text('Welcome to the App')],
      ),
    );
  }
}
