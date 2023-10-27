// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:irf_admin_panel/view/dashboard.dart';
import 'package:sizer/sizer.dart';

import '../../controller/post_controller.dart';

// import '../../controller/post_controller.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
   
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Color primarycolor = Color(0XFFEABE41);
    Color secondarycolor = Color(0XFF112853);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        leading: Image.asset(
          'asset/logo.png',
        ),
      ),
      body: Row(
        children: [
          Center(
            child: SizedBox(
              width: 30.w,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          backgroundColor: secondarycolor,
                          child: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: secondarycolor),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: TextField(
                                controller: usernameController,
                                decoration: InputDecoration(
                                    hintText: 'Username',
                                    hintStyle: TextStyle(
                                        color: const Color.fromARGB(
                                            132, 158, 158, 158)),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: secondarycolor),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                        color: const Color.fromARGB(
                                            132, 158, 158, 158)),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Spacer(),
                              Text(
                                'Forget password?',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 3.sp,
                                    color: Color.fromARGB(185, 158, 158, 158)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                    secondarycolor,
                                  ),
                                ),
                                onPressed: () async {
                                  print('----');
                                  late Future<bool> returnValues;

                                  returnValues = 
                                  createLogin(
                                      usernameController.text,
                                      passwordController.text,
                                      context);

                                  if (await returnValues) {
                                    print('22222');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const DashBoard(),
                                        ));
                                  } else {
                                    print("something wrong");
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: secondarycolor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to our website',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Login to access the admin details',
                  style: TextStyle(
                      color: primarycolor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
