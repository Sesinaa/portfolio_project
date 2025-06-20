import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final Function(bool newsletter, bool darkMode, bool offlineMode) onChanged;

  const SettingsPage({Key? key, required this.onChanged}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _newsletter = false;
  bool _darkMode = false;
  bool _offlineMode = false;

  void _updateSummary() {
    widget.onChanged(_newsletter, _darkMode, _offlineMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Einstellungen')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CheckboxListTile(
              title: const Text('Newsletter abonnieren'),
              value: _newsletter,
              onChanged: (value) {
                setState(() {
                  _newsletter = value ?? false;
                  _updateSummary();
                });
              },
            ),
            SwitchListTile(
              title: const Text('Dunkler Modus'),
              value: _darkMode,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                  _updateSummary();
                });
              },
            ),
            SwitchListTile(
              title: const Text('Offline-Modus'),
              value: _offlineMode,
              onChanged: (value) {
                setState(() {
                  _offlineMode = value;
                  _updateSummary();
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Zusammenfassung:\n'
              'Newsletter: ${_newsletter ? "Ja" : "Nein"}\n'
              'Dunkler Modus: ${_darkMode ? "An" : "Aus"}\n'
              'Offline-Modus: ${_offlineMode ? "An" : "Aus"}',

