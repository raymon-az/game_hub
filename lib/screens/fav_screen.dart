import 'package:flutter/material.dart';
import 'package:game_hub/providers/fav_scope.dart';

import 'game_details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = FavoritesScope.of(context).favorites.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('My Favorites ❤️')),

      body: favorites.isEmpty
          ? const Center(
              child: Text(
                'No favorite games yet.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final game = favorites[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        game.imageUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),

                    title: Text(
                      game.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    subtitle: Text('${game.genre} • ⭐ ${game.rating}'),

                    trailing: const Icon(Icons.favorite),

                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return GameDetailsScreen(game: game);
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
