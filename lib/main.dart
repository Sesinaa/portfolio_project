import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/profile_form_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _name = '';
  String _email = '';
  String _about = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Projekt',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/profile': (context) => ProfileFormPage(
          onSubmit: (name, email, about) {
            setState(() {
              _name = name;
              _email = email;
              _about = about;
            });
          },
        ),
      },
    );
  }
}

