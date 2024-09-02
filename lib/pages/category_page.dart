import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class BalanceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: TColor.gray,
            expandedHeight: MediaQuery.of(context).size.height * 0.40,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Container(
                padding: EdgeInsets.only(top: 60.0),
                alignment: Alignment.center,
                color: TColor.gray,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Category Name',
                      style: TextStyle(
                        fontSize: 36.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Total: \$15000',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Column(
                      children: [
                        SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    radius: 13,
                                    backgroundColor: TColor
                                        .primary20, // Match TransactionPage color
                                    child: Icon(
                                      Icons.arrow_upward,
                                      color: TColor
                                          .white, // Match TransactionPage icon color
                                      size: 19,
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    'Today',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: TColor
                                          .gray30, // Match TransactionPage text color
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    radius: 13,
                                    backgroundColor: TColor
                                        .primary20, // Match TransactionPage color
                                    child: Icon(
                                      Icons.arrow_upward,
                                      color: TColor
                                          .white, // Match TransactionPage icon color
                                      size: 19,
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    'This week',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: TColor
                                          .gray30, // Match TransactionPage text color
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '\$5', // Dummy income value
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: TColor
                                      .white, // Match TransactionPage text color
                                ),
                              ),
                              Text(
                                '\$500', // Dummy income value
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: TColor
                                      .white, // Match TransactionPage text color
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: Container(
                  child: SizedBox(
                    height: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                )),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                decoration: BoxDecoration(
                  color: TColor.gray80,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.0),
                  ),
                ),
                padding: EdgeInsets.all(20.0),
                child: Column(
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
              ),
            ]),
          ),
        ],
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
          child: Icon(
            Icons.arrow_upward,

            //isPositive ? Icons.arrow_upward : Icons.arrow_downward,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: TColor.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: TColor.white, fontSize: 10),
        ),
        trailing: Column(
          children: [
            Text(
              amount,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                // isPositive ? Colors.green : Colors.red,
              ),
            ),
            Text(date,
                style: TextStyle(
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
