import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ui/model/user_model.dart';

class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    isLoading(true);
    try {
      final response = await http.get(
        Uri.parse('https://friendlytalks.in/admin/api/v1/index.php?token=c97369129e36336e71096aabf2270aba'),
      );
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var userList = jsonResponse['data'] as List;
        users.value = userList.map((user) => User.fromJson(user)).toList();
      }
    } finally {
      isLoading(false);
    }
  }
}
