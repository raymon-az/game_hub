import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/game.dart';
import '../data/games.dart';

class FavoritesScope extends InheritedNotifier<FavoritesNotifier> {
  const FavoritesScope({
    super.key,
    required FavoritesNotifier notifier,
    required super.child,
  }) : super(notifier: notifier);
  static FavoritesNotifier of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<FavoritesScope>();

    if (scope == null || scope.notifier == null) {
      throw FlutterError('FavoritesScope not found in the widget tree.');
    }

    return scope.notifier!;
  }
}

class FavoritesNotifier extends ChangeNotifier {
  final Set<Game> _favorites = {};

  Set<Game> get favorites => Set.unmodifiable(_favorites);

  bool isFavorite(Game game) {
    return _favorites.contains(game);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    final favoriteTitles = prefs.getStringList('favoriteGames') ?? [];

    _favorites.clear();

    for (final title in favoriteTitles) {
      for (final game in games) {
        if (game.title == title) {
          _favorites.add(game);
          break;
        }
      }
    }

    notifyListeners();
  }

  Future<void> toggleFavorite(Game game) async {
    if (_favorites.contains(game)) {
      _favorites.remove(game);
    } else {
      _favorites.add(game);
    }

    await _saveFavorites();

    notifyListeners();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    final favoriteTitles = _favorites.map((game) => game.title).toList();

    await prefs.setStringList('favoriteGames', favoriteTitles);
  }
}
