import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_first/firebase_options.dart';
import 'package:firebase_first/views/screens/homePage.dart';
import 'package:firebase_first/views/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: '/home_page', page: () => const HomePage()),
        GetPage(name: '/', page: () => const LoginPage())
      ],
    );
  }
}
