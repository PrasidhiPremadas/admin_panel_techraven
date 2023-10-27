import 'dart:convert';

import 'package:irf_admin_panel/model/get_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EditController extends GetxController {

  final RxBool isSaving = false.obs;

  Future<void> updateUserData(UserDetails user) async {
    isSaving.value = true;

    final url =
        Uri.parse('http://15.206.68.154:5000/users/update/${user.userId}');
    final response = await http.put(url,
        body: json.encode(user.toJson()),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final updatedUserData = UserDetails.fromJson(jsonDecode(response.body));

      // final index =user.index
      print(updatedUserData.userName);
      print('updated:${updatedUserData}');
      print('User data updated successfully');
      print('balanceAmount :${updatedUserData.balanceAmount}');
      // print('userName :${updatedUserData.userName}');
       update();
    } else {
      print('Failed to update user data: ${response.statusCode}');
    }
    isSaving.value = false;
    update();
  }
}
