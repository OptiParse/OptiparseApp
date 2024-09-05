import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:optiparse/pages/all_transactions.dart';
import 'package:optiparse/pages/file_picker.dart';

import 'package:optiparse/pages/homepage.dart';
import 'package:optiparse/pages/settings.dart';
import 'package:optiparse/pages/transactions.dart';
import '../../common/color_extension.dart';
import 'profile_page.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentTabView = const HomePage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      body: Stack(children: [
        PageStorage(bucket: pageStorageBucket, child: currentTabView),
        SafeArea(
          child: Column(
            children: [
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset("assets/img/bottom_bar_bg.png"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  selectTab = 0;
                                  currentTabView = const HomePage();
                                });
                              },
                              icon: Image.asset(
                                "assets/img/home.png",
                                width: 20,
                                height: 20,
                                color: selectTab == 0
                                    ? TColor.white
                                    : TColor.gray30,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  selectTab = 0;
                                  currentTabView = allTransactions();
                                });
                              },
                              icon: Image.asset(
                                "assets/img/creditcards.png",
                                width: 20,
                                height: 20,
                                color: selectTab == 1
                                    ? TColor.white
                                    : TColor.gray30,
                              ),
                            ),
                            const SizedBox(
                              width: 50,
                              height: 50,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  selectTab = 0;
                                  currentTabView = const TransactionPage();
                                });
                              },
                              icon: Image.asset(
                                "assets/img/budgets.png",
                                width: 20,
                                height: 20,
                                color: selectTab == 2
                                    ? TColor.white
                                    : TColor.gray30,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  selectTab = 0;
                                  currentTabView = const SettingsView();
                                  // ProfileScreen();
                                });
                              },
                              icon: Image.asset(
                                "assets/img/settings.png",
                                width: 20,
                                height: 20,
                                color: selectTab == 3
                                    ? TColor.white
                                    : TColor.gray30,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      height: 60,
                      width: 55,
                      child: InkWell(
                        child: Image.asset("assets/img/center_btn.png"),
                        onTap: () {
                          Navigator.pushNamed(context, 'addTransaction');
                        },
                      ),
                    )
                    // Container(
                    //   height: 100,
                    //   width: 100,
                    //
                    //   // decoration: BoxDecoration(boxShadow: [
                    //   //   BoxShadow(
                    //   //       color: TColor.secondary.withOpacity(0.25),
                    //   //       blurRadius: 10,
                    //   //       offset: const Offset(0, 4))
                    //   // ], borderRadius: BorderRadius.circular(50)),
                    //   child: CircularMenu(
                    //     startingAngleInRadian: 3.66519,
                    //     // last item angle
                    //     endingAngleInRadian: 5.75959,
                    //     toggleButtonSize: 35,
                    //     radius: 90,
                    //     items: [
                    //       CircularMenuItem(
                    //           icon: Icons.file_copy_outlined,
                    //           color: TColor.gray50,
                    //           onTap: () {
                    //             print("file picker cliked");
                    //             Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => FilePickerPage()),
                    //             );
                    //           }),
                    //       CircularMenuItem(
                    //           icon: Icons.camera_alt,
                    //           color: TColor.gray50,
                    //           onTap: () {
                    //             Navigator.pushNamed(context, 'image_picker');
                    //           }),
                    //       CircularMenuItem(
                    //           icon: Icons.keyboard_alt_outlined,
                    //           color: TColor.gray50,
                    //           onTap: () {
                    //             Navigator.pushNamed(
                    //                 context, 'manual_transaction');
                    //           }),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
