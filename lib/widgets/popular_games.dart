import 'package:flutter/material.dart';
import 'package:game_hub/data/games.dart';
import 'package:game_hub/widgets/game_card.dart';

class PopularGames extends StatelessWidget {
  const PopularGames({super.key, required this.searchQuery});

  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    final filteredGames = games.where((game) {
      final title = game.title.toLowerCase();
      final genre = game.genre.toLowerCase();

      return title.contains(searchQuery) || genre.contains(searchQuery);
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popular Games',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        if (filteredGames.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Column(
                children: [
                  Icon(Icons.search_off, size: 50),
                  SizedBox(height: 12),
                  Text(
                    'No games found',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text('Try searching for another game.'),
                ],
              ),
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredGames.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.72,
            ),
            itemBuilder: (context, index) {
              return GameCard(game: filteredGames[index]);
            },
          ),
      ],
    );
  }
}
