// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:irf_admin_panel/view/custom_widget/button.dart';
import 'package:irf_admin_panel/view/screens/race_card/race_card.dart';
import 'package:irf_admin_panel/view/screens/user_details/User_screen.dart';
import 'package:irf_admin_panel/view/screens/tournament/tournament_screen.dart';
import 'package:sizer/sizer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});      

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 5, right: 5, top: 30),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UserScreen(),
                        ));
                      },
                      child: ButtonTile(text: 'Users')),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => RaceCard(),));
                      },
                      child: ButtonTile(text: 'Race Card')),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TournamentScreen(),
                        ));
                      },
                      child: ButtonTile(text: 'Tournaments')),
                  ButtonTile(text: 'Tansaction'),
                  ButtonTile(text: 'Reports'),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 10.h,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Registered Users',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(189, 17, 40, 83)),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 10.h,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Revenue Status',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(189, 17, 40, 83)),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 10.h,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Deposits',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(189, 17, 40, 83)),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 10.h,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Withdrawals',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(189, 17, 40, 83)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
