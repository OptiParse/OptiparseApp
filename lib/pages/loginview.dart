import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optiparse/common/color_extension.dart';
import '../secured_storage/storage_model.dart';
import 'package:logger/logger.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './bottomtab.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var size, height, width;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SecureStorage _secureStorage = SecureStorage();
  final logger = Logger();

  String _message = "";
  bool _isLoading = false; // State variable for loading

  void showLoginSuccessAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('Login Successful'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainTabView(), // Your main tab view widget
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    logger.i('Login called');

    final String email = _emailController.text;
    final String password = _passwordController.text;

    try {
      final response = await http.post(
        Uri.parse('http://172.23.21.80:3000/api/auth/login'), // Replace with your IP address
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final String token = responseData['token'];

        // Store the token securely
        await _secureStorage.deleteAllStorage();
        await _secureStorage.setToken(token);

        debugPrint("The token is $token");

        setState(() {
          _message = 'Login successful!';
          _isLoading = false; // Hide loading indicator
        });

        showLoginSuccessAlert();
      } else {
        setState(() {
          _message = 'Login failed: ${json.decode(response.body)['message']}';
          _isLoading = false; // Hide loading indicator
          logger.i(_message);
        });
      }
    } catch (e) {
      setState(() {
        _message = 'An error occurred: $e';
        logger.i(_message);
        _isLoading = false; // Hide loading indicator
      });
    }
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
        child: Stack(
          children: [
            SingleChildScrollView(
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
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: TColor.gray10,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Login to your account!",
                      style: TextStyle(
                        fontSize: 16,
                        color: TColor.gray20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: TColor.primary0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                    fontSize: 15,
                                    color: TColor.border,
                                  ),
                                  hintText: "Enter Email",
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.perm_identity_rounded,
                                    color: TColor.primary0,
                                  ),
                                ),
                                controller: _emailController,
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
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: TColor.border),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                    fontSize: 15,
                                    color: TColor.primary0,
                                  ),
                                  hintText: "Enter Password",
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.key_outlined,
                                    color: TColor.primary0,
                                  ),
                                ),
                                controller: _passwordController,
                                obscureText: true,
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
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: _login,
                        child: const Text("Login"),
                      ),
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          "New User? Register",
                          style: TextStyle(color: TColor.primary),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_isLoading)
              Positioned.fill(
                child: Container(
                  color: Colors.black54, // Semi-transparent overlay
                  child: Center(
                    child: SpinKitCircle(
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
