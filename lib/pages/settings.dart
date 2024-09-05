import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/icon_item_row.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: Center(
        child: Column(children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset("assets/img/back.png",
                          width: 25, height: 25, color: TColor.gray30))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Settings",
                    style: TextStyle(color: TColor.gray30, fontSize: 16),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/u1.png",
                width: 70,
                height: 70,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "OptiParse user",
                style: TextStyle(
                    color: TColor.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "codeforany@gmail.com",
                style: TextStyle(
                    color: TColor.gray30,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(
                  color: TColor.border.withOpacity(0.15),
                ),
                color: TColor.gray60.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                "Edit profile",
                style: TextStyle(
                    color: TColor.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 8),
                  child: Text(
                    "General",
                    style: TextStyle(
                        color: TColor.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: TColor.border.withOpacity(0.1),
                    ),
                    color: TColor.gray60.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const IconItemRow(
                        title: "Security",
                        icon: "assets/img/face_id.png",
                        value: "FaceID",
                      ),
                      IconItemSwitchRow(
                        title: "iCloud Sync",
                        icon: "assets/img/icloud.png",
                        value: isActive,
                        didChange: (newVal) {
                          setState(() {
                            isActive = newVal;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle logout action here
                        print("Logout clicked");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TColor.primary20, // Background color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          color: TColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
