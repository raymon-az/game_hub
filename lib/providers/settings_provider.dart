import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  bool _darkMode = true;
  bool _notifications = true;
  bool _soundEffects = true;
  bool _hapticFeedback = true;

  double _gameVolume = 70;
  String _selectedGenre = 'Action';

  bool get darkMode => _darkMode;
  bool get notifications => _notifications;
  bool get soundEffects => _soundEffects;
  bool get hapticFeedback => _hapticFeedback;
  double get gameVolume => _gameVolume;
  String get selectedGenre => _selectedGenre;

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    _darkMode = prefs.getBool('darkMode') ?? true;
    _notifications = prefs.getBool('notifications') ?? true;
    _soundEffects = prefs.getBool('soundEffects') ?? true;
    _hapticFeedback = prefs.getBool('hapticFeedback') ?? true;

    _gameVolume = prefs.getDouble('gameVolume') ?? 70;
    _selectedGenre = prefs.getString('selectedGenre') ?? 'Action';

    notifyListeners();
  }

  Future<void> setDarkMode(bool value) async {
    _darkMode = value;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', value);

    notifyListeners();
  }

  Future<void> setNotifications(bool value) async {
    _notifications = value;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications', value);

    notifyListeners();
  }

  Future<void> setSoundEffects(bool value) async {
    _soundEffects = value;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('soundEffects', value);

    notifyListeners();
  }

  Future<void> setHapticFeedback(bool value) async {
    _hapticFeedback = value;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hapticFeedback', value);

    notifyListeners();
  }

  Future<void> setGameVolume(double value) async {
    _gameVolume = value;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('gameVolume', value);

    notifyListeners();
  }

  Future<void> setSelectedGenre(String value) async {
    _selectedGenre = value;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedGenre', value);

    notifyListeners();
  }
}
