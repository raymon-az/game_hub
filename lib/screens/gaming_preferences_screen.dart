import 'package:flutter/material.dart';
import 'package:game_hub/providers/settings_scope.dart';

class GamingPreferencesScreen extends StatefulWidget {
  const GamingPreferencesScreen({super.key});

  @override
  State<GamingPreferencesScreen> createState() =>
      _GamingPreferencesScreenState();
}

class _GamingPreferencesScreenState extends State<GamingPreferencesScreen> {
  String selectedGenre = 'Action';
  double gameVolume = 70;
  

  final List<String> _genres = [
    'Action',
    'Adventure',
    'RPG',
    'Sports',
    'Racing',
    'Strategy',
  ];

  @override
  Widget build(BuildContext context) {
    final settings = SettingsScope.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Gaming Preferences')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Favorite Genre',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          DropdownButtonFormField<String>(
            initialValue: settings.selectedGenre,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.category),
            ),
            items: _genres.map((genre) {
              return DropdownMenuItem(value: genre, child: Text(genre));
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                settings.setSelectedGenre(value);
              }
            },
          ),

          const SizedBox(height: 30),

          const Text(
            'Game Volume',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          Row(
            children: [
              const Icon(Icons.volume_down),

              Expanded(
                child: Slider(
                  value: settings.gameVolume,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: '${settings.gameVolume.round()}%',
                  onChanged: (value) {
                    settings.setGameVolume(value);
                  },
                ),
              ),

              const Icon(Icons.volume_up),
            ],
          ),

          const Divider(),
          SwitchListTile(
            secondary: const Icon(Icons.music_note),
            title: const Text('Sound Effects'),
            subtitle: const Text('Enable game sound effects'),
            value: settings.soundEffects,
            onChanged: settings.setSoundEffects,
          ),
          SwitchListTile(
            secondary: const Icon(Icons.vibration),
            title: const Text('Haptic Feedback'),
            subtitle: const Text('Vibrate when interacting with the app'),
            value: settings.hapticFeedback,
            onChanged: settings.setHapticFeedback,
          ),

          const SizedBox(height: 20),

          Card(
            child: ListTile(
              leading: const Icon(Icons.check_circle),
              title: const Text('Preferences Saved'),
              subtitle: Text(
                'Genre: $selectedGenre • '
                'Volume: ${gameVolume.round()}%',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
