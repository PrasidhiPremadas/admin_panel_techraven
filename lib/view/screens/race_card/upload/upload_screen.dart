// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irf_admin_panel/view/screens/race_card/upload/filepicker_controller.dart';
import 'package:sizer/sizer.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FilePickerController fileController = Get.put(FilePickerController());
    // final RaceCardController raceCardController = Get.put(RaceCardController());

    Color secondarycolor = Color(0XFF112853);
    List<DataRow> dataRows = []; // Store the data rows for the DataTable

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () async {
                  print('1');
                  fileController.pickFile();
                },
                child: Container(
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Select file', textAlign: TextAlign.center),
                  ),
                ),
              ),
              Container(
                color: Colors.grey[200],
                width: 20.w,
                // height: 10.h,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(fileController.fileName.value),
                ),
              ),
              InkWell(
                onTap: () async {
                  print("filename:${fileController.fileName}");
                  await fileController.uploadFile();
                },
                child: Container(
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Upload', textAlign: TextAlign.center),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Container(
              color: secondarycolor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('RACE CARD',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center),
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              // scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Obx(() {
                    final raceCardDetails =
                        fileController.raceCardDetails.value;
            
                    if (raceCardDetails.sheet1.isEmpty) {
                      return Center(child: Text('No data available'));
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(50),
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text('Horse Name')),
                            DataColumn(label: Text('A/C/S')),
                            DataColumn(label: Text('Trainer')),
                            DataColumn(label: Text('Horse Number')),
                            DataColumn(label: Text('Weight')),
                            DataColumn(label: Text('Table Name')),
                          ],
                          rows: raceCardDetails.sheet1.map((data) {
                            return DataRow(cells: [
                              DataCell(Text(data.horseName)),
                              DataCell(Text(data.aCS)),
                              DataCell(Text(data.trainer)),
                              DataCell(Text(data.horseNumber.toString())),
                              DataCell(Text(data.weight.toString())),
                              DataCell(Text(data.tableName.toString())),
                            ]);
                          }).toList(),
                        ),
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Container(
          //       color: Colors.grey[200],
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Text('Cancel', textAlign: TextAlign.center),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 20,
          //     ),
          //     Container(
          //       color: Colors.grey[200],
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Text('Confirm', textAlign: TextAlign.center),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 10.w,
          //     )
          //   ],
          // ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
