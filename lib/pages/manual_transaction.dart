import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ManualTransactionPage extends StatefulWidget {
  @override
  _ManualTransactionPageState createState() => _ManualTransactionPageState();
}

class _ManualTransactionPageState extends State<ManualTransactionPage> {
  final TextEditingController merchantController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController receiptController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  void dispose() {
    // Dispose of controllers when the widget is disposed of
    merchantController.dispose();
    priceController.dispose();
    addressController.dispose();
    receiptController.dispose();
    dateController.dispose();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Manual Transaction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: merchantController,
              decoration: InputDecoration(labelText: 'Merchant Name'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: receiptController,
              decoration: InputDecoration(labelText: 'Receipt No.'),
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                labelText: 'Date',
                suffixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );

                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  setState(() {
                    dateController.text = formattedDate;
                  });
                }
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle form submission here
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

