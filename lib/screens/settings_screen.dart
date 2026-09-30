import 'package:flutter/material.dart';
import 'package:game_hub/providers/settings_scope.dart';
import 'package:game_hub/screens/gaming_preferences_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    final settings = SettingsScope.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),

      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Text(
              'Appearance',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),

          SwitchListTile(
            secondary: const Icon(Icons.dark_mode),
            title: const Text('Dark Mode'),
            subtitle: const Text('Use a dark gaming interface'),
            value: settings.darkMode,
            onChanged: settings.setDarkMode,
          ),

          const Divider(),

          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Text(
              'Notifications',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),

          SwitchListTile(
            secondary: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            subtitle: const Text('Get updates about your games'),
            value: _notifications,
            onChanged: (value) {
              setState(() {
                _notifications = value;
              });
            },
          ),

          const Divider(),

          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Text(
              'General',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.sports_esports),
            title: const Text('Gaming Preferences'),
            subtitle: const Text('Customize your gaming experience'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const GamingPreferencesScreen(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About Game Hub'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Game Hub',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2026 Game Hub',
                children: const [
                  Text(
                    'A Flutter gaming app built while learning '
                    'animations, navigation and state management.',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
