import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:mrx_charts/mrx_charts.dart';

import '../common/color_extension.dart';

// Dummy class to simulate data structure similar to what was intended with Hive
class AddData {
  final String name;
  final DateTime datetime;
  final String amount;
  final String IN;

  AddData({
    required this.name,
    required this.datetime,
    required this.amount,
    required this.IN,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  // Dummy data for demonstration
  final List<AddData> transactions = [
    AddData(
        name: 'Groceries',
        datetime: DateTime.now(),
        amount: '\$50',
        IN: 'Expense'),
    AddData(
        name: 'Salary',
        datetime: DateTime.now(),
        amount: '\$500',
        IN: 'Income'),
    AddData(
        name: 'Coffee', datetime: DateTime.now(), amount: '\$5', IN: 'Expense'),
    AddData(
        name: 'Freelance',
        datetime: DateTime.now(),
        amount: '\$150',
        IN: 'Income'),
  ];

  final List<String> day = [
    'Monday',
    "Tuesday",
    "Wednesday",
    "Thursday",
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray, // Match TransactionPage background color
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 340, child: _head()),
                  SizedBox(
                    height: 200, // Adjust the height as needed
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Chart(
                        layers: layers(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _head() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                color: TColor.gray70, // Match TransactionPage color
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello!',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: TColor
                                .white, // Match TransactionPage text color
                          ),
                        ),
                        Text(
                          'OptiParse User',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: TColor
                                .white, // Match TransactionPage text color
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 140,
          left: 37,
          child: Container(
            height: 170,
            width: 320,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: TColor.gray50.withOpacity(0.3), // Adjust shadow color
                  offset: const Offset(0, 6),
                  blurRadius: 12,
                  spreadRadius: 6,
                ),
              ],
              color: TColor.gray60, // Match TransactionPage color
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Expense',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color:
                              TColor.white, // Match TransactionPage text color
                        ),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: TColor.white, // Match TransactionPage icon color
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text(
                        '\$500', // Dummy total balance value
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color:
                              TColor.white, // Match TransactionPage text color
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor:
                                TColor.primary20, // Match TransactionPage color
                            child: Icon(
                              Icons.arrow_upward,
                              color: TColor
                                  .white, // Match TransactionPage icon color
                              size: 19,
                            ),
                          ),
                          const SizedBox(width: 7),
                          Text(
                            'This week',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: TColor
                                  .white, // Match TransactionPage text color
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor:
                                TColor.primary20, // Match TransactionPage color
                            child: Icon(
                              Icons.arrow_upward,
                              color: TColor
                                  .white, // Match TransactionPage icon color
                              size: 19,
                            ),
                          ),
                          const SizedBox(width: 7),
                          Text(
                            'This Month',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: TColor
                                  .white, // Match TransactionPage text color
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$500', // Dummy income value
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color:
                              TColor.white, // Match TransactionPage text color
                        ),
                      ),
                      Text(
                        '\$50', // Dummy expenses value
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color:
                              TColor.white, // Match TransactionPage text color
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        //const Spacer(),
        // Adjusting the graph position to appear below the card
      ],
    );
  }

  // Function that returns chart layers
  List<ChartLayer> layers() {
    final from = DateTime(2021, 4);
    final to = DateTime(2021, 8);
    final frequency =
        (to.millisecondsSinceEpoch - from.millisecondsSinceEpoch) / 3.0;
    return [
      ChartHighlightLayer(
        shape: () => ChartHighlightLineShape<ChartLineDataItem>(
          backgroundColor: const Color(0xFF331B6D),
          currentPos: (item) => item.currentValuePos,
          radius: const BorderRadius.all(Radius.circular(8.0)),
          width: 60.0,
        ),
      ),
      ChartAxisLayer(
        settings: ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            frequency: frequency,
            max: to.millisecondsSinceEpoch.toDouble(),
            min: from.millisecondsSinceEpoch.toDouble(),
            textStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 10.0,
            ),
          ),
          y: ChartAxisSettingsAxis(
            frequency: 100.0,
            max: 400.0,
            min: 0.0,
            textStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 10.0,
            ),
          ),
        ),
        labelX: (value) => DateFormat('MMM')
            .format(DateTime.fromMillisecondsSinceEpoch(value.toInt())),
        labelY: (value) => value.toInt().toString(),
      ),
      ChartLineLayer(
        items: List.generate(
          4,
          (index) => ChartLineDataItem(
            x: (index * frequency) + from.millisecondsSinceEpoch,
            value: Random().nextInt(380) + 20,
          ),
        ),
        settings: const ChartLineSettings(
          color: Color(0xFF8043F9),
          thickness: 4.0,
        ),
      ),
      ChartTooltipLayer(
        shape: () => ChartTooltipLineShape<ChartLineDataItem>(
          backgroundColor: Colors.white,
          circleBackgroundColor: Colors.white,
          circleBorderColor: const Color(0xFF331B6D),
          circleSize: 4.0,
          circleBorderThickness: 2.0,
          currentPos: (item) => item.currentValuePos,
          onTextValue: (item) => '\$${item.value.toString()}',
          marginBottom: 6.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          radius: 6.0,
          textStyle: const TextStyle(
            color: Color(0xFF8043F9),
            letterSpacing: 0.2,
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ];
  }
}
