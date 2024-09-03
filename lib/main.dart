import 'package:flutter/material.dart';
import 'package:optiparse/pages/bottomtab.dart';
import 'package:optiparse/pages/firstview.dart';
import 'package:optiparse/pages/profile_page.dart';
import 'package:optiparse/pages/transactions.dart';
import './pages/loginview.dart';
import './pages/registerview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OptiParse',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const FirstView(),
      home: const MainTabView(),
      routes: {
        '/register': (context) => const RegistrationPage(),
        'login': (context) => const LoginPage(),
        'home': (context) => const MainTabView(),
        'transactions': (context) => const TransactionPage(),
        'profile': (context) => const ProfileScreen(),
      },
    );
  }
}
