import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // Settings values
  bool isDarkMode = false;
  bool notificationsEnabled = true;
  String selectedLanguage = 'English';

  // Method to handle theme change
  void _updateTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  // Method to handle language change
  void _updateLanguage(String? value) {
    setState(() {
      selectedLanguage = value ?? 'English';
    });
  }

  // Save settings (you can persist them here with SharedPreferences or other methods)
  void _saveSettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Settings saved successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            // Dark Mode Toggle
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: isDarkMode,
              onChanged: _updateTheme,
              secondary: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            ),

            // Notifications Toggle
            SwitchListTile(
              title: const Text('Enable Notifications'),
              value: notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  notificationsEnabled = value;
                });
              },
            ),

            // Language Selector
            DropdownButtonFormField<String>(
              value: selectedLanguage,
              onChanged: _updateLanguage,
              items: ['English', 'Spanish', 'French'].map((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Select Language',
                border: OutlineInputBorder(),
              ),
            ),

            // Save Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                onPressed: _saveSettings,
                child: const Text('Save Settings'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
