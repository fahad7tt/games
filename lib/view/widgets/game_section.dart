import 'package:flutter/material.dart';
import 'package:ui/model/game_item.dart';
import 'package:ui/view/widgets/game_card.dart';

class GameSection extends StatelessWidget {
  final String title;
  final List<GameItem> games;
  final VoidCallback onViewAll;

  const GameSection({
    super.key, 
    required this.title,
    required this.games,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title, 
                style: const TextStyle(
                  fontSize: 22, 
                  fontWeight: FontWeight.w800
                ),
              ),
              GestureDetector(
                onTap: onViewAll,
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black, // Color of the underline
                        width: 1.5, // Thickness of the underline
                      ),
                    ),
                  ),
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 140,
          child: Padding(
            padding: const EdgeInsets.only(left: 14),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: games.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 14.0), // Add spacing between cards
                  child: GameCard(game: games[index]),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
