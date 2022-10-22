import 'package:flutter/material.dart';

class ClintScreen extends StatelessWidget {
  const ClintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('Clints Screen')
        ],
      ),
    );
  }
}
