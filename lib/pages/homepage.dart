// lib/homepage.dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finance Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, [User]',
              style: Theme.of(context).textTheme.headlineSmall, // Updated to headlineSmall
            ),
            SizedBox(height: 20),
            Card(
              child: ListTile(
                title: Text('Total Balance'),
                subtitle: Text('\$12,345.67'),
                leading: Icon(Icons.account_balance_wallet),
              ),
            ),
            SizedBox(height: 20),
            Card(
              child: ListTile(
                title: Text('Recent Transactions'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('• Starbucks: \$5.00'),
                    Text('• Rent: \$1,200.00'),
                    Text('• Salary: \$3,500.00'),
                  ],
                ),
                leading: Icon(Icons.list_alt),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to transaction history
              },
              child: Text('View All Transactions'),
            ),
          ],
        ),
      ),
    );
  }
}
