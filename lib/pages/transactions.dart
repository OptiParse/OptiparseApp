import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:optiparse/pages/all_transactions.dart';
import '../common/color_extension.dart';
import '../common_widget/budgets_row.dart';
import '../common_widget/custom_arc_180_painter.dart';
import './settings.dart';
import 'category_page.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  List budgetArr = [
    {
      "name": "Auto & Transport",
      "icon": "assets/img/auto_&_transport.png",
      "spend_amount": "25.99",
      "total_budget": "400",
      "left_amount": "250.01",
      "color": TColor.secondaryG
    },
    {
      "name": "Entertainment",
      "icon": "assets/img/entertainment.png",
      "spend_amount": "50.99",
      "total_budget": "600",
      "left_amount": "300.01",
      "color": TColor.secondary50
    },
    {
      "name": "Security",
      "icon": "assets/img/security.png",
      "spend_amount": "5.99",
      "total_budget": "600",
      "left_amount": "250.01",
      "color": TColor.primary10
    },
  ];

  final nameController = TextEditingController();
  final budgetController = TextEditingController();

  Future<void> _displayTextInputDialog(BuildContext context) async {
    nameController.clear();
    budgetController.clear();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Category'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Category Name',
                ),
              ),
              TextField(
                controller: budgetController,
                decoration: const InputDecoration(
                  labelText: 'Total Budget',
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final String name = nameController.text.isNotEmpty
                    ? nameController.text
                    : 'Unnamed Category';
                final String budget = budgetController.text.isNotEmpty
                    ? budgetController.text
                    : '0.00';

                if (name.isNotEmpty && budget.isNotEmpty) {
                  setState(() {
                    budgetArr.add({
                      "name": name,
                      "icon": "assets/img/security.png", // Default icon
                      "spend_amount": "0.00",
                      "total_budget": budget,
                      "left_amount": budget,
                      "color": TColor.gray30 // Default color
                    });
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Expenses',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: TColor.primary0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => allTransactions(),
                    ),
                  );
                },
                child: Container(
                  height: 64,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: TColor.border.withOpacity(0.1),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Show all transactions",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: budgetArr.length,
                itemBuilder: (context, index) {
                  var bObj = budgetArr[index] as Map? ?? {};

                  return BudgetsRow(
                    bObj: bObj,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BalanceSection(),
                        ),
                      );
                    },
                  );
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  _displayTextInputDialog(context);
                },
                child: DottedBorder(
                  dashPattern: const [5, 4],
                  strokeWidth: 1,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(16),
                  color: TColor.border.withOpacity(0.1),
                  child: Container(
                    height: 64,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add new category ",
                          style: TextStyle(
                              color: TColor.gray30,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Image.asset(
                          "assets/img/add.png",
                          width: 12,
                          height: 12,
                          color: TColor.gray30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 110,
            ),
          ],
        ),
      ),
    );
  }
}
