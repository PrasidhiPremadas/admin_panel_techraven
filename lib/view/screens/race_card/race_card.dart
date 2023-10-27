// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:irf_admin_panel/view/screens/race_card/saved_file/saved_file_screen.dart';
import 'package:irf_admin_panel/view/screens/race_card/upload/upload_screen.dart';

class RaceCard extends StatelessWidget {
  const RaceCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Color secondarycolor = Color(0XFF112853);
    Color primarycolor = Color(0XFFEABE41);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TabBar(
                    indicatorWeight: 7,
                    labelColor: Colors.black,
                    labelStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    indicatorColor: primarycolor,
                    tabs: [
                      Tab(
                        text: 'Upload',
                      ),
                      Tab(
                        text: 'Saved files',
                      ),
                    ]),
              ),
              Expanded(
                child: TabBarView(children: [
                  
                  UploadScreen(),
                  SavedFileScreen(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
