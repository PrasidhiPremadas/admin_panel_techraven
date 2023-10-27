
import 'dart:convert';

List<List<UserDetails>> userDetailsFromJson(String str) => List<List<UserDetails>>.from(json.decode(str).map((x) => List<UserDetails>.from(x.map((x) => UserDetails.fromJson(x)))));

String userDetailsToJson(List<List<UserDetails>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class UserDetails {
  String? email;
  String id;
  String? userId;
  String otp;
  String? userName;
  String? phoneNumber;
  int? balanceAmount; // Make sure this matches the API response
  String? kycStatus;
  DateTime registeredDate;
  int v;
  String? firstName;
  String? gender;
  String? kycPancardNumber;
  String? lastName;
  DateTime? dateOfBirth;
  String? kycAadharCardNumber;
  String? accountNumber;
  String? bankName;
  String? ifscCode;
  String? upiId;

  UserDetails({
    this.email,
    required this.id,
    this.userId,
    required this.otp,
    this.userName,
    this.phoneNumber,
    this.balanceAmount,
    this.kycStatus,
    required this.registeredDate,
    required this.v,
    this.firstName,
    this.gender,
    this.kycPancardNumber,
    this.lastName,
    this.dateOfBirth,
    this.kycAadharCardNumber,
    this.accountNumber,
    this.bankName,
    this.ifscCode,
    this.upiId,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        email: json["email"],
        id: json["_id"],
        userId: json["userId"],
        otp: json["otp"],
        userName: json["userName"],
        phoneNumber: json["phoneNumber"],
        balanceAmount: json["balanceAmount"] ?? 0, // Handle null with default value
        kycStatus: json["kycStatus"],
        registeredDate: DateTime.parse(json["registeredDate"]),
        v: json["__v"],
        firstName: json["firstName"],
        gender: json["gender"],
        kycPancardNumber: json["kycPancardNumber"],
        lastName: json["lastName"],
        dateOfBirth: json["dateOfBirth"] == null
            ? null
            : DateTime.parse(json["dateOfBirth"]),
        kycAadharCardNumber: json["kycAadharCardNumber"],
        accountNumber: json["accountNumber"],
        bankName: json["bankName"],
        ifscCode: json["ifscCode"],
        upiId: json["upiId"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "_id": id,
        "userId": userId,
        "otp": otp,
        "userName": userName,
        "phoneNumber": phoneNumber,
        "balanceAmount": balanceAmount,
        "kycStatus": kycStatus,
        "registeredDate": registeredDate.toIso8601String(),
        "__v": v,
        "firstName": firstName,
        "gender": gender,
        "kycPancardNumber": kycPancardNumber,
        "lastName": lastName,
        "dateOfBirth": dateOfBirth?.toIso8601String(), // Handle null
        "kycAadharCardNumber": kycAadharCardNumber,
        "accountNumber": accountNumber,
        "bankName": bankName,
        "ifscCode": ifscCode,
        "upiId": upiId,
      };
}

