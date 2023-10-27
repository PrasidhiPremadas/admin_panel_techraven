// import 'package:excel/excel.dart';
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:irf_admin_panel/model/post_race_card.dart';

class FilePickerController extends GetxController {
  Rx<File?> selectedFile = Rx<File?>(null);
  RxString fileName = 'No file selcted'.obs;
  List<DataRow> dataRows = [];
  var raceCardDetails = RaceCardDetails(sheet1: []).obs;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['xls', "xlsx"]);
    if (result != null) {
      fileName.value = result.files.single.name;
      selectedFile.value = File(result.files.single.path!);
      // update();
    }
  }

  Future<void> uploadFile() async {
    print('-----------');
    final file = selectedFile.value;

    if (file == null) {
      Get.snackbar('Failed', 'No file selected',
          snackPosition: SnackPosition.TOP,
          backgroundColor: const Color.fromARGB(113, 33, 149, 243));
      print('No file selected');
      return;
    }

    final url = Uri.parse(
        'http://15.206.68.154:5000/users/upload/raceCards'); // Replace with your server's URL.
    // Create a multipart request
    final request = http.MultipartRequest('POST', url);

    // Add the file to be uploaded
    request.files.add(http.MultipartFile(
      'file',
      file.readAsBytes().asStream(),
      file.lengthSync(),
      filename: file.toString(), // Replace with your desired file name.
    ));
    print('-------${file.toString()}');

    try {
      // Send the request
      final response = await request.send();
      final responsebody = await response.stream.bytesToString();

      print('------------------');

      // Check the response status
      if (response.statusCode == 200) {
        print('---=======-----');

        Get.snackbar('Sucessful', 'File uploaded sucessfully',
            snackPosition: SnackPosition.TOP,
            backgroundColor: const Color.fromARGB(113, 33, 149, 243));

        // final jsonData  = json.decode(responsebody);
        final Map<String, dynamic> jsonData = json.decode(responsebody);
        raceCardDetails.value = RaceCardDetails.fromJson(jsonData);

        // Get.to(UploadScreen(raceCarDDetails: raceCardDetails));

        print(jsonData);
        print("racecarddetails:${raceCardDetails}");
        print('------------------++++');
        print(raceCardDetails.value.sheet1[1].horseName);
        print(raceCardDetails.value.sheet1[1].horseNumber);

        print('File uploaded successfully');

        // print(response);
      } else {
        print('File upload failed with status: ${response.statusCode}');
        return;
      }
    } catch (error) {
      Get.snackbar('Error', 'Something Went Wrong',
          snackPosition: SnackPosition.TOP,
          backgroundColor: const Color.fromARGB(113, 33, 149, 243));
      print('Error uploading file: $error');
      return;
    }
  }
}
