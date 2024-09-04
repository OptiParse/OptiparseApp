import 'package:flutter/material.dart';
import 'package:optiparse/common/color_extension.dart';
import './loginview.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// registration page starts

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  RegistrationPageState createState() => RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var size, height, width;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _message = '';
  bool _isLoading = false;

  void showLoginSuccessAlert(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                if (_message == 'User registered successfully!') {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            LoginPage(), // Your login page widget
                      ));
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });

    final String name = _nameController.text;
    final String password = _passwordController.text;
    final String email = _emailController.text;

    final response = await http.post(
      Uri.parse('http://172.23.21.80:3000/api/auth/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      setState(() {
        _message = 'User registered successfully!';
      });
    } else {
      setState(() {
        _message = 'Registration failed: ${json.decode(response.body)['error']}';
      });
    }

    showLoginSuccessAlert(_message);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      backgroundColor: TColor.gray,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/img/app_logo.png",
                      height: height / 3,
                      width: double.infinity,
                    ),
                    Text(
                      "Register Here!",
                      style: TextStyle(
                        fontFamily: "OpenSans-VariableFont_wdth,wght",
                        color: TColor.primary,
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text("Register Now for Our Facial Attendance App"),
                    SizedBox(height: height / 30),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        color: TColor.gray80,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Full Name',
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        color: TColor.gray80,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'E-mail',
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        color: TColor.gray80,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          contentPadding: EdgeInsets.all(10),
                        ),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        color: TColor.gray80,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      
                    ),
                    const SizedBox(height: 40),
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
                        onPressed: _register,
                        child: const Text('Register'),
                      ),
                    ),
                    const SizedBox(height: 40),
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
                        onPressed: (){
                          Navigator.pushNamed(context, 'login') ;
                        },
                        child: const Text('Back to Login'),
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
