import 'package:flutter/material.dart';
import '../providers/fav_scope.dart';
import 'package:game_hub/screens/game_details_screen.dart';

import '../models/game.dart';

class GameCard extends StatefulWidget {
  const GameCard({super.key, required this.game});

  final Game game;

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final favorites = FavoritesScope.of(context);
    final isFavorite = favorites.isFavorite(widget.game);

    return AnimatedScale(
      scale: _isPressed ? 0.90 : 1.0,
      duration: const Duration(milliseconds: 110),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return GameDetailsScreen(game: widget.game);
                },
              ),
            );
          },
          onTapDown: (_) {
            setState(() {
              _isPressed = true;
            });
          },
          onTapUp: (_) {
            setState(() {
              _isPressed = false;
            });
          },
          onTapCancel: () {
            setState(() {
              _isPressed = false;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Hero(
                    tag: widget.game.title,
                    child: Image.network(
                      widget.game.imageUrl,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    top: 4,
                    right: 4,
                    child: IconButton(
                      onPressed: () {
                        FavoritesScope.of(context).toggleFavorite(widget.game);
                      },
                      icon: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          key: ValueKey(isFavorite),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.game.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      widget.game.genre,
                      style: const TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        const Icon(Icons.star, size: 18),
                        const SizedBox(width: 4),
                        Text(widget.game.rating.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
