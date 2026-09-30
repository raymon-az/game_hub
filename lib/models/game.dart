class Game {
  const Game({
    required this.title,
    required this.genre,
    required this.rating,
    required this.imageUrl,
  });

  final String title;
  final String genre;
  final double rating;
  final String imageUrl;

  @override
  bool operator ==(Object other) {
    return other is Game && other.title == title;
  }

  @override
  int get hashCode => title.hashCode;
}
