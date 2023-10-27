// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:irf_admin_panel/view/screens/user_details/User_screen.dart';
import 'package:irf_admin_panel/view/screens/homescreen.dart';
import 'package:irf_admin_panel/view/screens/race_card/race_card.dart';
import 'package:irf_admin_panel/view/screens/tournament/tournament_screen.dart';
import 'package:sizer/sizer.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final List<Widget> _screens = [
    Homescreen(),
    UserScreen(),
    RaceCard(),
    TournamentScreen(),
    Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Text('Promotion'),
    ),
    Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Text('Report'),
    ),
    Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Text('Bannner'),
    ),
    Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Text('Cms page'),
    ),
    Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Text('Action log'),
    ),
  ];
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  int _selectedIndex = 0;

  @override
  @override
  Widget build(BuildContext context) {
    Color primarycolor = Color(0XFFEABE41);
    Color secondarycolor = Color(0XFF112853);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        elevation: 25,
        actions: [
          SizedBox(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('asset/logo.png'),
          )),
          SizedBox(
            width: 5,
          ),
          Center(
              child: Text(
            'DASHBOARD',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          )),
          Spacer(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.logout_rounded,
                  color: secondarycolor,
                ),
              ),
            ),
          )
        ],
      ),
      body: Row(
        children: [
          Container(
            width: 17.w,
            child: NavigationRail(
                onDestinationSelected: (value) {
                  setState(() {
                    _selectedIndex = value;
                  });
                },
                labelType: NavigationRailLabelType.all,
                backgroundColor: secondarycolor,
                destinations: [
                  NavigationRailDestination(
                      icon: SizedBox(
                          //  width: 10,
                          ),
                      label: Text(
                        'Dashboard',
                        style: TextStyle(color: Colors.white),
                      )),
                  NavigationRailDestination(
                      icon: SizedBox(
                          // width: 10,
                          ),
                      label:
                          Text('Users', style: TextStyle(color: Colors.white))),
                  NavigationRailDestination(
                      icon: SizedBox(
                          //  width: 10,
                          ),
                      label: Text('Race Card',
                          style: TextStyle(color: Colors.white))),
                  NavigationRailDestination(
                      icon: SizedBox(
                          // width: 10,
                          ),
                      label: Text('Tournament',
                          style: TextStyle(color: Colors.white))),
                  NavigationRailDestination(
                      icon: SizedBox(
                          // width: 10,
                          ),
                      label: Text('Promotions',
                          style: TextStyle(color: Colors.white))),
                  NavigationRailDestination(
                      icon: SizedBox(
                          // width: 10,
                          ),
                      label: Text('Reports',
                          style: TextStyle(color: Colors.white))),
                  NavigationRailDestination(
                      icon: SizedBox(
                          // width: 10,
                          ),
                      label: Text('Banner',
                          style: TextStyle(color: Colors.white))),
                  NavigationRailDestination(
                      icon: SizedBox(
                          // width: 10,
                          ),
                      label: Text('CMS Page',
                          style: TextStyle(color: Colors.white))),
                  NavigationRailDestination(
                      icon: SizedBox(
                          // width: 10,
                          ),
                      label: Text('Action Log',
                          style: TextStyle(color: Colors.white))),
                ],
                selectedIndex: _selectedIndex),
          ),
          Expanded(child: _screens[_selectedIndex]),
        ],
      ),
    );
  }
}
