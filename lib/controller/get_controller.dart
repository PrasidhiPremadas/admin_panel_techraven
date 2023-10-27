// // ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:irf_admin_panel/model/get_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const baseUrl ='http://15.206.68.154:5000/users/getAllUser';

  Future<List<UserDetails>>getAllUser()async{

    final response =await http.get(Uri.parse(baseUrl));

    if(response.statusCode==200){
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((json) => UserDetails.fromJson(json)).toList();
    }
    else{
      throw Exception('Failed to load userdata');
    }
  }
}

class UserController extends GetxController{

  final ApiServices apiServices =ApiServices();
  final RxList<UserDetails> users =<UserDetails>[].obs;

  UserController(){
    fetchUsers(); //for automatic display the fetched api data(sending constructor)
  }

  Future<void>fetchUsers()async{
    try{

      final userList = await apiServices.getAllUser();
      users.assignAll(userList);

    }catch(e){
      print('Error fetching User :$e');
    }
  }
}
