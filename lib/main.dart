import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/profile_form_page.dart';
import 'pages/settings_page.dart';
import 'pages/slider_page.dart';
import 'pages/summary_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Gespeicherte Daten
  String _name = '';
  String _email = '';
  String _about = '';
  double _sliderValue = 50;
  bool _newsletter = false;
  bool _darkMode = false;
  bool _offlineMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Projekt',
      initialRoute: '/',
      routes: {
        '/': (context) => Scaffold(
              appBar: AppBar(title: const Text('Portfolio Start')),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/profile'),
                      child: const Text('Profil bearbeiten'),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/slider'),
                      child: const Text('Slider-Seite'),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/settings'),
                      child: const Text('Einstellungen'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SummaryPage(
                              name: _name,
                              email: _email,
                              about: _about,
                              sliderValue: _sliderValue,
                              newsletter: _newsletter,
                              darkMode: _darkMode,
                              offlineMode: _offlineMode,
                            ),
                          ),
                        );
                      },
                      child: const Text('Zur Zusammenfassung'),
                    ),
                  ],
                ),
              ),
            ),
        '/profile': (context) => ProfileFormPage(
              onSubmit: (name, email, about) {
                setState(() {
                  _name = name;
                  _email = email;
                  _about = about;
                });
              },
            ),
        '/slider': (context) => SliderPage(
              initialValue: _sliderValue,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
        '/settings': (context) => SettingsPage(
              onChanged: (newsletter, darkMode, offlineMode) {
                setState(() {
                  _newsletter = newsletter;
                  _darkMode = darkMode;
                  _offlineMode = offlineMode;
                });
              },
            ),
      },
    );
  }
}

