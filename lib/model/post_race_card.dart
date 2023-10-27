// To parse this JSON data, do
//
//     final raceCardDetails = raceCardDetailsFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/src/material/data_table.dart';

List<RaceCardDetails> raceCardDetailsFromJson(String str) => List<RaceCardDetails>.from(json.decode(str).map((x) => RaceCardDetails.fromJson(x)));

String raceCardDetailsToJson(List<RaceCardDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RaceCardDetails {
    List<Sheet1> sheet1;

    RaceCardDetails({
        required this.sheet1,
    });

    factory RaceCardDetails.fromJson(Map<String, dynamic> json) => RaceCardDetails(
        sheet1: List<Sheet1>.from(json["Sheet1"].map((x) => Sheet1.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Sheet1": List<dynamic>.from(sheet1.map((x) => x.toJson())),
    };

  map(DataRow Function(dynamic data) param0) {}
}

class Sheet1 {
    TableName tableName;
    int horseNumber;
    int drawBox;
    String horseName;
    String aCS;
    String trainer;
    String jockey;
    double weight;
    int? allowance;
    int rating;

    Sheet1({
        required this.tableName,
        required this.horseNumber,
        required this.drawBox,
        required this.horseName,
        required this.aCS,
        required this.trainer,
        required this.jockey,
        required this.weight,
        this.allowance,
        required this.rating,
    });

    factory Sheet1.fromJson(Map<String, dynamic> json) => Sheet1(
        tableName: tableNameValues.map[json["tableName"]]!,
        horseNumber: json["Horse Number"],
        drawBox: json["Draw Box"],
        horseName: json["Horse Name"],
        aCS: json["A/C/S"],
        trainer: json["Trainer"],
        jockey: json["Jockey"],
        weight: json["Weight"]?.toDouble(),
        allowance: json["Allowance"],
        rating: json["Rating"],
    );

    Map<String, dynamic> toJson() => {
        "tableName": tableNameValues.reverse[tableName],
        "Horse Number": horseNumber,
        "Draw Box": drawBox,
        "Horse Name": horseName,
        "A/C/S": aCS,
        "Trainer": trainer,
        "Jockey": jockey,
        "Weight": weight,
        "Allowance": allowance,
        "Rating": rating,
    };
}

enum TableName {
    RACE_1,
    RACE_2,
    RACE_3,
    RACE_4,
    RACE_5
}

final tableNameValues = EnumValues({
    "Race 1": TableName.RACE_1,
    "Race 2": TableName.RACE_2,
    "Race 3": TableName.RACE_3,
    "Race 4": TableName.RACE_4,
    "Race 5": TableName.RACE_5
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
