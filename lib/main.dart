import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modu/chat_pages/chat_page.dart';
import 'login/root_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modu',
      theme: ThemeData(
        primaryColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      ),
      home: ChatPage(),
      //home: RootPage(),
    );
  }
}
