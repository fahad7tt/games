import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/controller/navigation_controller.dart';
import 'package:ui/controller/users_controller.dart';
import 'package:ui/view/screens/home_screen.dart';

class UserListPage extends StatelessWidget {
  final NavigationController navigationController = Get.put(NavigationController());
  final UserController userController = Get.put(UserController());

  UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User List',
          style: TextStyle(
            fontWeight: FontWeight.w500, 
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Update the navbar index to point to the home icon
            navigationController.changeIndex(2); // Assuming home icon is at index 2
            // Navigate back to the home page
            Get.offAll(() => HomeScreen());
          },
        ),
      ),
      body: Obx(() {
        if (userController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (userController.users.isEmpty) {
          return const Center(child: Text('No users found.'));
        } else {
          return ListView.builder(
            itemCount: userController.users.length,
            itemBuilder: (context, index) {
              final user = userController.users[index];
              return Padding(
                padding: const EdgeInsets.all(4),
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text('Name: ${user.name}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email: ${user.email}'),
                        const SizedBox(height: 4), 
                        Text(
                          'Password: ${user.password}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
