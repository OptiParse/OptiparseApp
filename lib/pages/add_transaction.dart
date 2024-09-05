import 'package:flutter/material.dart';
import 'package:optiparse/common/color_extension.dart';

class AddTransaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      appBar: AppBar(
        backgroundColor: TColor.gray,
        title: Text(
          'Add Transaction',
          style: TextStyle(color: TColor.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: TColor.gray30),
              onPressed: () {
                Navigator.pushNamed(context, 'manual_transaction');
              },
              child: Text(
                'Add Manual Transaction',
                style: TextStyle(color: TColor.white),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: TColor.gray30),
              onPressed: () {
                Navigator.pushNamed(context, 'file_picker');
              },
              child: Text(
                'Select Files',
                style: TextStyle(color: TColor.white),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: TColor.gray30),
              onPressed: () {
                Navigator.pushNamed(context, 'image_picker');
              },
              child: Text(
                'Capture Images',
                style: TextStyle(color: TColor.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
