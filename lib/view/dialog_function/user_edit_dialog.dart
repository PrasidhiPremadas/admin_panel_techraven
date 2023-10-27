

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irf_admin_panel/controller/edit_controller.dart';
import 'package:irf_admin_panel/model/get_data.dart';

class EditDialog extends GetxController{
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController acNumController = TextEditingController();
  TextEditingController balanceAmtController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController aadharNumController = TextEditingController();
  TextEditingController panNumController = TextEditingController();
  Future<void> showUserEditDialog(UserDetails user)async{

//  TextEditingController userNameController = TextEditingController();
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneNumController = TextEditingController();
//   TextEditingController bankNameController = TextEditingController();
//   TextEditingController acNumController = TextEditingController();
//   TextEditingController balanceAmtController = TextEditingController();
//   TextEditingController ifscCodeController = TextEditingController();
//   TextEditingController aadharNumController = TextEditingController();
//   TextEditingController panNumController = TextEditingController();
   return showDialog<void>(context:Get.context!, builder: (context) {
      return AlertDialog(
         title: Text('Edit User Data'),
           content: SingleChildScrollView(
      child: Column(
        children: [
          UpdateTextField(
              controller: userNameController, text: 'User Name'),
          UpdateTextField(
              controller: firstNameController,
              text: 'First Name'),
          UpdateTextField(
              controller: lastNameController, text: 'Last Name'),
          UpdateTextField(
              controller: emailController, text: 'Email'),
          UpdateTextField(
              controller: bankNameController, text: 'Bank Name'),
          UpdateTextField(
              controller: phoneNumController,
              text: 'Phone Number'),
          UpdateTextField(
              controller: acNumController,
              text: 'Account Number'),
          UpdateTextField(
              controller: balanceAmtController,
              text: 'Balance Amount'),
          UpdateTextField(
              controller: ifscCodeController, text: 'Ifsc Code'),
          UpdateTextField(
              controller: aadharNumController,
              text: 'Aadhar Number'),
          UpdateTextField(
              controller: panNumController, text: 'Pan Number')
        ],
        
      ),
    ),
       actions: [
      TextButton(
          onPressed: () {
            user.balanceAmount = int.parse(balanceAmtController.text);
            balanceAmtController.clear();
            user.userName = userNameController.text;
            userNameController.clear();
            user.lastName = lastNameController.text ;
            lastNameController.clear();
            user.firstName = firstNameController.text;
            firstNameController.clear();
            user.email = emailController.text;
            emailController.clear();
            user.bankName = bankNameController.text;
            bankNameController.clear();
            user.ifscCode = ifscCodeController.text ;
            ifscCodeController.clear();
            user.kycAadharCardNumber = aadharNumController.text;
            aadharNumController.clear();
            user.kycPancardNumber = panNumController.text;
            panNumController.clear();
           

          EditController().updateUserData(user);

            Get.back();
          },
          child: Text(
            'Save',
            style: TextStyle(color: Colors.black),
          )),
    ],
      );
   },);

   

}


}
class UpdateTextField extends StatelessWidget {
  var controller;
  String text;

  UpdateTextField({super.key, required this.controller, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: text),
    );
  }
}