import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/controller/users_controller.dart';
import 'package:ui/controller/navigation_controller.dart';
import 'package:ui/model/game_item.dart';
import 'package:ui/view/widgets/friends_list.dart';
import 'package:ui/view/widgets/game_section.dart';
import 'package:ui/view/widgets/greeting_section.dart';

class HomeScreen extends StatelessWidget {
  final UserController userController = Get.find<UserController>();
  final NavigationController navigationController = Get.put(NavigationController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(78.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9.0).copyWith(top: 14.0),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: const GreetingSection(),
              actions: [
                Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    width: 50, 
    height: 50,
    decoration: BoxDecoration(
      image: const DecorationImage(
        image: AssetImage('images/user.jpg'),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(6), 
    ),
  ),
),

              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 13, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FriendsList(),
              const SizedBox(height: 25),
               Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  'Recently Released',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[500],
                  ),
                ),
              ),
              GameSection(
                title: "Popular Games",
                games: [
                  GameItem('Jetpack Joy', 'Action packed', 'images/jetpack.jpg'),
                  GameItem('X Fighter', 'Battle Royale', 'images/x_fighter.jpg'),
                  GameItem('Ninja Run', 'Real Action', 'images/ninja.jpg'),
                ],
                onViewAll: () {},
              ),
              const SizedBox(height: 20),
              GameSection(
                title: "Recommended Games",
                games: [
                  GameItem('Road Fight', 'Shooting Car', 'images/cars.jpg'),
                  GameItem('Vikings', 'Sons of Ragnar', 'images/vikings.jpg'),
                ],
                onViewAll: () {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() => CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.black,
        buttonBackgroundColor: Colors.black,
        height: 60,
        items: const <Widget>[
          Icon(Icons.mic_none_outlined, color: Colors.grey),
          Icon(Icons.message_outlined, color: Colors.grey),
          Icon(Icons.home, color: Colors.white, size: 30),
          Icon(Icons.favorite_border_outlined, color: Colors.grey),
          Icon(Icons.search_outlined, color: Colors.grey),
        ],
        index: navigationController.currentIndex.value,
        onTap: (index) {
          navigationController.changeIndex(index);
        },
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
      )),
    );
  }
}
