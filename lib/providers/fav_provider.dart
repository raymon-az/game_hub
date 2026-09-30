import 'package:flutter/material.dart';

import '../models/game.dart';

class FavoritesProvider extends InheritedWidget {
  const FavoritesProvider({
    super.key,
    required this.favorites,
    required super.child,
  });

  final Set<Game> favorites;

  static FavoritesProvider of(BuildContext context) {
    final result = context
        .dependOnInheritedWidgetOfExactType<FavoritesProvider>();

    assert(result != null, 'FavoritesProvider not found in context.');

    return result!;
  }

  @override
  bool updateShouldNotify(FavoritesProvider oldWidget) {
    return favorites != oldWidget.favorites;
  }
}
