import 'package:flutter/material.dart';

class GameCategories extends StatefulWidget {
  const GameCategories({super.key});

  @override
  State<GameCategories> createState() => _GameCategoriesState();
}

class _GameCategoriesState extends State<GameCategories> {
  final List<String> _categories = [
    'All',
    'Action',
    'Racing',
    'Sports',
    'RPG',
    'Horror',
    'Puzzle',
  ];
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _categories.map((category) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(category),
                  selected: _selectedCategory == category,
                  onSelected: (selected) {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                ),
              );
            }).toList()
          ),
        ),
      ],
    );
  }
}
