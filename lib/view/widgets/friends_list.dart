import 'package:flutter/material.dart';

class FriendsList extends StatelessWidget {
  const FriendsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildFriendAvatar('Invite', 'images/user5.png'),
          _buildFriendAvatar('Jane', 'images/user1.jpg'),
          _buildFriendAvatar('Annie', 'images/user2.jpg'),
          _buildFriendAvatar('John', 'images/user3.jpg'),
          _buildFriendAvatar('Gwen', 'images/user4.jpg'),
        ],
      ),
    );
  }

  Widget _buildFriendAvatar(String name, String imagePath) {
    final bool isInvite = name == 'Invite';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 27,
          ),
          const SizedBox(height: 9),
          Text(
            name,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isInvite ? FontWeight.bold : FontWeight.w400,
              color: isInvite ? Colors.black : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
