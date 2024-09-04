import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction App Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'manual_transaction');
              },
              child: Text('Add Manual Transaction'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'file_picker');
              },
              child: Text('Select Files'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'image_picker');
              },
              child: Text('Capture Images'),
            ),
          ],
        ),
      ),
    );
  }
}
