// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter_test/flutter_test.dart';
import 'package:game_hub/main.dart';
import 'package:game_hub/providers/fav_scope.dart';
import 'package:game_hub/providers/settings_provider.dart';
import 'package:game_hub/providers/settings_scope.dart';

void main() {
  testWidgets('Game Hub loads', (WidgetTester tester) async {
    final settingsProvider = SettingsProvider();
    final favoritesNotifier = FavoritesNotifier();

    await settingsProvider.loadSettings();
    await favoritesNotifier.loadFavorites();

    await tester.pumpWidget(
      FavoritesScope(
        notifier: favoritesNotifier,
        child: SettingsScope(
          notifier: settingsProvider,
          child: const GameHub(),
        ),
      ),
    );

    expect(find.text('Game Hub'), findsOneWidget);
  });
}
