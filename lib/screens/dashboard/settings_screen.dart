import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final VoidCallback toggleThemeMode;
  const SettingsScreen({super.key, required this.toggleThemeMode});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Notifications'),
            trailing: Switch(value: true, onChanged: (value) {}),
          ),
          ListTile(
            title: const Text('Language'),
            trailing: DropdownButton<String>(
              value: 'English',
              items: ['English', 'French', 'Spanish']
                  .map((language) => DropdownMenuItem(
                        value: language,
                        child: Text(language),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
          ),
          ListTile(
            title: const Text('Theme'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (bool value) {
                toggleThemeMode();
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Placeholder logout logic
              //Navigator.pushNamedAndRemoveUntil(
              //    context, '/login', (route) => false);
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
