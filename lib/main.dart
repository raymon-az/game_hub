import 'package:flutter/material.dart';
import 'package:game_hub/providers/settings_provider.dart';
import 'package:game_hub/providers/settings_scope.dart';

import 'providers/fav_scope.dart';
import 'screens/splash_screen.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final settingsProvider = SettingsProvider();
  final favoritesNotifier = FavoritesNotifier();

  await settingsProvider.loadSettings();
  await favoritesNotifier.loadFavorites();

  runApp(
    FavoritesScope(
      notifier: favoritesNotifier,
      child: SettingsScope(notifier: settingsProvider, child: const GameHub()),
    ),
  );
}

class GameHub extends StatelessWidget {
  const GameHub({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = SettingsScope.of(context);

    return MaterialApp(
      themeAnimationDuration: Duration(milliseconds: 500),

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF9F7FC),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),

      themeMode: settings.darkMode ? ThemeMode.dark : ThemeMode.light,

      home: const SplashScreen(),
    );
  }
}
