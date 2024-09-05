import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class allTransactions extends StatefulWidget {
  @override
  State<allTransactions> createState() => _allTransactionsState();
}

class _allTransactionsState extends State<allTransactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      // appBar: AppBar(
      //   title: Text('Transactions'),
      //   backgroundColor: TColor.gray50,
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.06,
                  bottom: MediaQuery.of(context).size.height * 0.01,
                  left: MediaQuery.of(context).size.height * 0.01,
                  right: MediaQuery.of(context).size.height * 0.01),
              child: SearchAnchor(
                  builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  controller: controller,
                  padding: const WidgetStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0)),
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (_) {
                    controller.openView();
                  },
                  leading: const Icon(Icons.search),
                  trailing: <Widget>[
                    Tooltip(
                      message: 'Filter',
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.filter_alt_outlined),
                      ),
                    )
                  ],
                );
              }, suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                return List<ListTile>.generate(5, (int index) {
                  final String item = 'item $index';
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        controller.closeView(item);
                      });
                    },
                  );
                });
              }),
            ),

            // Subtitle: "All Transactions"
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'All transactions',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: TColor.primary0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),

            // List of Transactions
            Column(
              children: [
                TransactionItem(
                    title: 'Adobe Collection',
                    subtitle: 'Payment via wallet can be done',
                    amount: '-\$125.50',
                    date: '1/1/2001',
                    details:
                        ' title: Adobe Collection Payment via wallet can be done, amount: \$125.50'),
                TransactionItem(
                    title: 'Uplabs',
                    subtitle: 'Payment Received',
                    amount: '+\$95.99',
                    date: '1/1/2001',
                    details:
                        ' title: Adobe Collection Payment via wallet can be done, amount: \$125.50'),
                TransactionItem(
                    title: 'Netflix',
                    subtitle: 'Account Subscription',
                    amount: '-\$30.00',
                    date: '1/1/2001',
                    details:
                        ' title: Adobe Collection Payment via wallet can be done, amount: \$125.50'),
                TransactionItem(
                    title: 'PayPal',
                    subtitle: 'Payment Received',
                    amount: '+\$2,150.00',
                    date: '1/1/2001',
                    details:
                        ' title: Adobe Collection Payment via wallet can be done, amount: \$125.50'),
                TransactionItem(
                    title: 'John Hopkins',
                    subtitle: 'Transaction',
                    amount: '+\$4,000.00',
                    date: '1/1/2001',
                    details:
                        ' title: Adobe Collection Payment via wallet can be done, amount: \$125.50'),
                TransactionItem(
                    title: 'John Hopkins',
                    subtitle: 'Transaction',
                    amount: '+\$4,000.00',
                    date: '1/1/2001',
                    details:
                        ' title: Adobe Collection Payment via wallet can be done, amount: \$125.50'),
                TransactionItem(
                    title: 'John Hopkins',
                    subtitle: 'Transaction',
                    amount: '+\$4,000.00',
                    date: '1/1/2001',
                    details:
                        ' title: Adobe Collection Payment via wallet can be done, amount: \$125.50'),
                TransactionItem(
                    title: 'John Hopkins',
                    subtitle: 'Transaction',
                    amount: '+\$4,000.00',
                    date: '1/1/2001',
                    details:
                        ' title: Adobe Collection Payment via wallet can be done, amount: \$125.50'),
                TransactionItem(
                    title: 'John Hopkins',
                    subtitle: 'Transaction',
                    amount: '+\$4,000.00',
                    date: '1/1/2001',
                    details:
                        ' title: Adobe Collection Payment via wallet can be done, amount: \$125.50'),
                TransactionItem(
                    title: 'Adobe Collection',
                    subtitle: 'Payment via wallet can be done',
                    date: '1/1/2001',
                    amount: '-\$125.50',
                    details:
                        ' title: Adobe Collection Payment via wallet can be done, amount: \$125.50'),
                TransactionItem(
                    title: 'Uplabs',
                    subtitle: 'Payment Received',
                    amount: '+\$95.99',
                    date: '1/1/2001',
                    details:
                        ' title: Adobe Collection Payment via wallet can be done, amount: \$125.50'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final String details;
  final String date;
  //final bool isPositive;

  const TransactionItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.details,
    required this.date,
    //required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: CircleAvatar(
          radius: 15.0,
          backgroundColor: TColor.primary20,
          //isPositive ? Colors.green : Colors.red,
          child: const Icon(
            Icons.arrow_upward,

            //isPositive ? Icons.arrow_upward : Icons.arrow_downward,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: TColor.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
              color: TColor.gray30, fontSize: 11, fontWeight: FontWeight.w500),
        ),
        trailing: Column(
          children: [
            Text(
              amount,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.red,
                // isPositive ? Colors.green : Colors.red,
              ),
            ),
            Text(date,
                style: TextStyle(
                  fontSize: 10,
                  color: TColor.white,
                ))
          ],
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              details,
              style: TextStyle(
                color: TColor.gray30,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
