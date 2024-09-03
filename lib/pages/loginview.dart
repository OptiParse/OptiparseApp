import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optiparse/common/color_extension.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var size, height, width;
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // getting the size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/optiparse/hi-removebg-preview.png',
                  width: double.infinity,
                  height: height / 3,
                ),
                // const SizedBox(
                //   height: 25,
                // ),
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: TColor.gray10),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Login to your account!",
                  style: TextStyle(fontSize: 16, color: TColor.gray20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height / 20,
                ),
                Container(
                  // height: 55,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: TColor.primary0),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: TextField(
                            decoration: InputDecoration(
                              hintStyle:
                                  TextStyle(fontSize: 15, color: TColor.border),
                              hintText: "Enter User ID",
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.perm_identity_rounded,
                                color: TColor.primary0,
                              ),
                            ),
                            controller: userIdController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Container(
                  // height: 55,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: TColor.border),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: TextField(
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  fontSize: 15, color: TColor.primary0),
                              hintText: "Enter Password",
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.key_outlined,
                                color: TColor.primary0,
                              ),
                            ),
                            controller: userIdController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: height / 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: TColor.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Get.snackbar("Logged In", "Welcome Back {User}!",
                            duration: const Duration(seconds: 1),
                            colorText: Colors.white,
                            backgroundColor: Colors.green);
                        Navigator.pushNamed(context, '/home');
                      },
                      child: const Text("Login")),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: TColor.gray10,
                          // foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        "New User ? Register",
                        style: TextStyle(color: TColor.primary),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
