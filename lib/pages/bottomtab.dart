import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:optiparse/pages/homepage.dart';
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
  String _colorName = 'No';
  Color _color = Colors.black;

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
                                  currentTabView = const TransactionPage();
                                });
                              },
                              icon: Image.asset(
                                "assets/img/budgets.png",
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
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/img/calendar.png",
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
                                  currentTabView = const ProfileScreen();
                                });
                              },
                              icon: Image.asset(
                                "assets/img/creditcards.png",
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
                    // CircularMenu(
                    //   //alignment: Alignment.bottomCenter,
                    //   backgroundWidget: Center(
                    //     child: RichText(
                    //       text: TextSpan(
                    //         style: TextStyle(color: Colors.black, fontSize: 28),
                    //         children: <TextSpan>[
                    //           TextSpan(
                    //             text: _colorName,
                    //             style: TextStyle(
                    //                 color: _color, fontWeight: FontWeight.bold),
                    //           ),
                    //           TextSpan(text: ' button is clicked.'),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    //   toggleButtonColor: Colors.pink,
                    //   items: [
                    //     CircularMenuItem(
                    //         icon: Icons.home,
                    //         color: Colors.green,
                    //         onTap: () {
                    //           setState(() {
                    //             _color = Colors.green;
                    //             _colorName = 'Green';
                    //           });
                    //         }),
                    //     CircularMenuItem(
                    //         icon: Icons.search,
                    //         color: Colors.blue,
                    //         onTap: () {
                    //           setState(() {
                    //             _color = Colors.blue;
                    //             _colorName = 'Blue';
                    //           });
                    //         }),
                    //     CircularMenuItem(
                    //         icon: Icons.settings,
                    //         color: Colors.orange,
                    //         onTap: () {
                    //           setState(() {
                    //             _color = Colors.orange;
                    //             _colorName = 'Orange';
                    //           });
                    //         }),
                    //   ],
                    // ),
                    InkWell(
                      onTap: () {
                        // Navigator.pushNamed(context, 'addTransaction');
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.all(20),
                        // decoration: BoxDecoration(boxShadow: [
                        //   BoxShadow(
                        //       color: TColor.secondary.withOpacity(0.25),
                        //       blurRadius: 10,
                        //       offset: const Offset(0, 4))
                        // ], borderRadius: BorderRadius.circular(50)),
                        child: CircularMenu(
                          toggleButtonSize: 35,
                          radius: 90,
                          items: [
                            CircularMenuItem(
                                icon: Icons.file_copy_outlined,
                                color: TColor.gray50,
                                onTap: () {
                                  setState(() {
                                    Navigator.pushNamed(context, 'file_picker');
                                  });
                                }),
                            CircularMenuItem(
                                icon: Icons.camera_alt,
                                color: TColor.gray50,
                                onTap: () {
                                  setState(() {
                                    Navigator.pushNamed(
                                        context, 'image_picker');
                                  });
                                }),
                            CircularMenuItem(
                                icon: Icons.keyboard_alt_outlined,
                                color: TColor.gray50,
                                onTap: () {
                                  setState(() {
                                    Navigator.pushNamed(
                                        context, 'manual_transaction');
                                  });
                                }),
                          ],
                        ),
                      ),
                    )
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
