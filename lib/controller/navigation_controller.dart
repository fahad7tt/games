// import 'package:get/get.dart';

// class NavigationController extends GetxController {
//   var selectedIndex = 2.obs; // Default to the home screen (index 2)

//   void changeIndex(int index) {
//     selectedIndex.value = index;
//   }
// }

// home_controller.dart
import 'package:get/get.dart';
import 'package:ui/view/screens/user_list_page.dart';

class NavigationController extends GetxController {
  var currentIndex = 2.obs; // Default to home screen (index 2)

  void changeIndex(int index) {
    currentIndex.value = index;
    if (index == 1) { // Assuming index 1 is for the message button
      Get.to(UserListPage());
    }
  }
}
