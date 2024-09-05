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
import './secured_storage/storage_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:logger/logger.dart';
import './secured_storage/storage_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  MyApp({super.key});

  final logger = Logger();

  final SecureStorage _secureStorage = SecureStorage();

  Future<String?> _checkToken() async {
    String? token = await _secureStorage.getToken();
    if (token != null && !JwtDecoder.isExpired(token)) {
      logger.i('Token is not expired');
      logger.i('Token is not expired');
      return token;
    } else {
      await _secureStorage.deleteAllStorage();
      logger.i('Storage cleared');
      await _secureStorage.deleteAllStorage();
      logger.i('Storage cleared');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OptiParse',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // home: FilePickerPage(),
      home: FutureBuilder<String?>(
        future: _checkToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasData) {
            logger.i('going to main taab view');
          } else if (snapshot.hasData) {
            logger.i('going to main taab view');
            return MainTabView();
          } else {
            logger.i('going to First view');
            return MainTabView();
          }
          logger.i('going to First view');
          return FirstView();
          logger.i('going to First view');
          return FirstView();
        },
      ),
      routes: {
        '/register': (context) => const RegistrationPage(),
        'login': (context) => const LoginPage(),
        'home': (context) => const MainTabView(),
        'transactions': (context) => const TransactionPage(),
        'profile': (context) => const ProfileScreen(),
        'addTransaction': (context) => AddTransaction(),
        'manual_transaction': (context) => ManualTransactionPage(),
        'file_picker': (context) => FilePickerPage(),
        'image_picker': (context) => ImagePickerPage(),
        'file_picker': (context) => FilePickerPage(),
        'image_picker': (context) => ImagePickerPage(),
      },
    );
  }
}
