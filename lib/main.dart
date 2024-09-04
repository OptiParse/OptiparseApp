import 'package:flutter/material.dart';
import 'package:optiparse/pages/add_transaction.dart';
import './pages/bottomtab.dart';
import './pages/firstview.dart';
import './pages/profile_page.dart';
import './pages/transactions.dart';
import './pages/loginview.dart';
import './pages/registerview.dart';
import './pages/add_transaction.dart';
import './pages/manual_transaction.dart';
import './pages/file_picker.dart';
import './pages/image_picker.dart';

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
        'addTransaction': (context) => AddTransaction(),
        'manual_transaction': (context) => ManualTransactionPage(),
        'file_picker':(context) => FilePickerPage(),
        'image_picker':(context)=> ImagePickerPage(),

      },
    );
  }
}
