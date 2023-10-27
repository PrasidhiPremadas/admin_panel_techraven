// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, dead_code, prefer_typing_uninitialized_variables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:irf_admin_panel/controller/edit_controller.dart';
import 'package:irf_admin_panel/controller/get_controller.dart';
import 'package:irf_admin_panel/view/custom_widget/button.dart';
import 'package:get/get.dart';
import 'package:irf_admin_panel/view/dialog_function/user_edit_dialog.dart';
import 'package:sizer/sizer.dart';
import '../../../model/get_data.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<UserDetails> userData = [];

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                Row(
                children: [
                  ButtonTile(text: 'Registered Users'),
                  ButtonTile(text: 'Add User')
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() => userController.users.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : DataTable(
                        columns: createcolumn(),
                        rows:
                            List.generate(userController.users.length, (index) {
                          final user = userController.users[index];
                          return DataRow(cells: [
                            DataCell(Text(user.userId ?? "-")),
                            DataCell(Text(user.userName ?? '-')),
                            DataCell(Text(user.firstName?.toString() ?? '-')),
                            DataCell(Text(user.lastName?.toString() ?? '-')),
                            DataCell(Text(user.email ?? '-')),
                            DataCell(Text(user.phoneNumber ?? '-')),
                            DataCell(Text(userController
                                    .users[index].balanceAmount
                                    ?.toString() ??
                                '-')),
                            DataCell(TextButton(
                                style: ButtonStyle(),
                                onPressed: () {
                                  showdialogs(user);
                                },
                                child: Text(
                                  'view more',
                                  style: TextStyle(color: Colors.blue),
                                ))),
                          ]);
                        }))),
              )),
            ])),
      ),
    );
  }

  List<DataColumn> createcolumn() {
    return [
      DataColumn(label: Text('User Id')),
      DataColumn(label: Text('User name')),
      DataColumn(label: Text('First name')),
      DataColumn(label: Text('Last name')),
      DataColumn(label: Text('Email')),
      DataColumn(label: Text('Phone')),
      DataColumn(label: Text('Balance')),
      DataColumn(label: Text('more'))
    ];
  }

  showdialogs(UserDetails user) {
    EditDialog editDialog = Get.put(EditDialog());
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "User Details",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          content: Container(
            width: 400.w,
            decoration: BoxDecoration(
                // border: Border.all(color: const Color.fromARGB(128, 158, 158, 158))
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Table(
                  // border: TableBorder.symmetric(),
                  children: [
                    TableRow(children: [
                      Text(''),
                      Text(''),
                    ]),
                    TableRow(children: [
                      Text(
                        'User Id ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.grey[600]),
                      ),
                      Text(
                        user.userId ?? "-",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Text('User Name ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.grey[600])),
                      Text(
                        user.userName ?? "-",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text('First Name ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.grey[600])),
                      Text(
                        user.firstName ?? "-",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text('Last Name ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.grey[600])),
                      Text(
                        user.lastName ?? "-",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text('Email ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.grey[600])),
                      Text(
                        user.email ?? "-",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text('Phone Number ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.grey[600])),
                      Text(
                        user.phoneNumber ?? "-",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text('Bank Name',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.grey[600])),
                      Text(
                        user.bankName ?? "-",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text('Account Number ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.grey[600])),
                      Text(
                        user.accountNumber ?? "-",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text('Balance Amount ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.grey[600])),
                      Text(
                        user.balanceAmount?.toString() ?? "-",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text('IFSC Code ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.grey[600])),
                      Text(
                        user.ifscCode?.toString() ?? "-",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text('KYC Status ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.grey[600])),
                      Text(
                        user.kycStatus?.toString() ?? "-",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text('Aadhar Number',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.grey[600])),
                      Text(
                        user.kycAadharCardNumber?.toString() ?? "-",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text('Pan Card Number ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.grey[600])),
                      Text(
                        user.kycPancardNumber?.toString() ?? "-",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ]),
                  ],
                )
              ],
            ),
          ),
          actions: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return editDataDialog(user);
                      },
                    );
                  },
                  child: Text(
                    "Edit",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Close",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}

Widget editDataDialog(UserDetails user) {
  EditController editController = Get.put(EditController());

  TextEditingController userNameController =
      TextEditingController(text: user.userName);
  TextEditingController firstNameController =
      TextEditingController(text: user.firstName);
  TextEditingController lastNameController =
      TextEditingController(text: user.lastName);
  TextEditingController emailController =
      TextEditingController(text: user.email);
  TextEditingController phoneNumController =
      TextEditingController(text: user.phoneNumber);
  TextEditingController bankNameController =
      TextEditingController(text: user.bankName);
  TextEditingController acNumController =
      TextEditingController(text: user.accountNumber);
  TextEditingController balanceAmtController =
      TextEditingController(text: user.balanceAmount.toString());
  TextEditingController ifscCodeController =
      TextEditingController(text: user.ifscCode);
  TextEditingController aadharNumController =
      TextEditingController(text: user.kycAadharCardNumber);
  TextEditingController panNumController =
      TextEditingController(text: user.kycPancardNumber);

  return AlertDialog(
    title: Text('Edit User Data'),
    content: SingleChildScrollView(
      child: Column(
        children: [
          EditTextField(controller: userNameController, text: 'User Name'),
          EditTextField(controller: firstNameController, text: 'First Name'),
          EditTextField(controller: lastNameController, text: 'Last Name'),
          EditTextField(controller: emailController, text: 'Email'),
          EditTextField(controller: bankNameController, text: 'Bank Name'),
          EditTextField(controller: phoneNumController, text: 'Phone Number'),
          EditTextField(controller: acNumController, text: 'Account Number'),
          EditTextField(
              controller: balanceAmtController, text: 'Balance Amount'),
          EditTextField(controller: ifscCodeController, text: 'Ifsc Code'),
          EditTextField(controller: aadharNumController, text: 'Aadhar Number'),
          EditTextField(controller: panNumController, text: 'Pan Number')
        ],
      ),
    ),
    actions: [
      // TextButton(
      //     onPressed: () {
      //       user.balanceAmount =
      //           int.parse(balanceAmtController.text);
      //      balanceAmtController.clear();
      //       user.userName =userNameController.text;
      //      userNameController.clear();
      //       user.lastName =lastNameController.text;
      //      lastNameController.clear();
      //       user.firstName =firstNameController.text;
      //      firstNameController.clear();
      //       user.email =emailController.text;
      //      emailController.clear();
      //       user.bankName =bankNameController.text;
      //      bankNameController.clear();
      //       user.ifscCode =ifscCodeController.text;
      //      ifscCodeController.clear();
      //       user.kycAadharCardNumber =aadharNumController.text;
      //      aadharNumController.clear();
      //       user.kycPancardNumber =panNumController.text;
      //      panNumController.clear();
      //   editController.updateUserData(user);

      //       Get.back();

      //     },
      //     child: Text(
      //       'Save',
      //       style: TextStyle(color: Colors.black),
      //     )),
      TextButton(
        onPressed: () async {
          // Update user data fields
          user.balanceAmount = int.parse(balanceAmtController.text);
          balanceAmtController.clear();
          user.userName = userNameController.text;
          userNameController.clear();
          user.lastName = lastNameController.text;
          lastNameController.clear();
          user.firstName = firstNameController.text;
          firstNameController.clear();
          user.email = emailController.text;
          emailController.clear();
          user.bankName = bankNameController.text;
          bankNameController.clear();
          user.ifscCode = ifscCodeController.text;
          ifscCodeController.clear();
          user.kycAadharCardNumber = aadharNumController.text;
          aadharNumController.clear();
          user.kycPancardNumber = panNumController.text;
          panNumController.clear();

          // Call the updateUserData method from EditController
          await editController.updateUserData(user);

          // Get.back() can be called directly after the await, no matter the state
          Get.back();
        },
        child: Obx(() {
          return editController.isSaving.value
              ? CircularProgressIndicator() // Show a loading indicator while saving
              : Text(
                  'Save',
                  style: TextStyle(color: Colors.black),
                );
        }),
      )
    ],
  );
}

class EditTextField extends StatelessWidget {
  var controller;
  String text;

  EditTextField({super.key, required this.controller, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: text),
    );
  }
}

class TextTile extends StatelessWidget {
  String text;
  TextTile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    Color secondarycolor = Color.fromARGB(155, 17, 40, 83);
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        color: secondarycolor,
      ),
    );
  }
}

class DialogTile extends StatelessWidget {
  String text;
  DialogTile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    Color secondarycolor = Color.fromARGB(155, 17, 40, 83);
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        color: secondarycolor,
      ),
    );
  }
}

class DetailsTile extends StatelessWidget {
  String text;
  DetailsTile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        color: const Color.fromARGB(175, 27, 94, 31),
      ),
    );
  }
}
