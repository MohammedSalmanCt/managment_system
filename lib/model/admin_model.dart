import 'package:cloud_firestore/cloud_firestore.dart';

class AdminModel{
  final String name;
  final String password;
  final String role;
  final String id;
  final String email;
  final String phoneNumber;
  // final DocumentReference? reference;
  final bool delete;
  final List<String> search;
  final DateTime createdTime;
  final String photoUrl;
  final int status;
  final Address address;
  final bool subscription;
  final DateTime subscriptionStartDate;
  final DateTime subscriptionEndDate;
  final int numberOfSalesMan;
  final int allowedNumberOfSalesMan;
  final double usingFileStorage;
  final double allowedFileStorage;

  AdminModel({
    required this.name,
    required this.password,
    // this.reference,
    required this.email,
    required this.id,
    required this.role,
    required this.createdTime,
    required this.status,
    required this.delete,
    required this.search,
    required this.photoUrl,
    required this.address,
    required this.usingFileStorage,
    required this.allowedFileStorage,
    required this.allowedNumberOfSalesMan,
    required this.numberOfSalesMan,
    required this.phoneNumber,
    required this.subscription,
    required this.subscriptionEndDate,
    required this.subscriptionStartDate
  });


  AdminModel copyWith({
    String? name,
    String? password,
    String? id,
    String? role,
    String? email,
    bool? delete,
    // DocumentReference? reference,
    List<String>? search,
    DateTime? createdTime,
    String? photoUrl,
    int? status,
    Address? address,
    String? phoneNumber,
    bool? subscription,
    DateTime? subscriptionStartDate,
    DateTime? subscriptionEndDate,
    int? numberOfSalesMan,
    int? allowedNumberOfSalesMan,
    double? usingFileStorage,
    double? allowedFileStorage,

  }) {
    return AdminModel(
      name:name??this.name,
      password:password ?? this.password,
      id:id ?? this.id,
      email: email ?? this.email,
      role:role ?? this.role,
      delete:delete ?? this.delete,
      search: search ?? this.search,
      // reference:reference ?? this.reference,
      createdTime: createdTime ?? this.createdTime,
      status: status ?? this.status,
      photoUrl: photoUrl ?? this.photoUrl,
      address: address ?? this.address,
      allowedFileStorage: allowedFileStorage ?? this.allowedFileStorage,
      usingFileStorage: usingFileStorage ?? this.usingFileStorage,
      allowedNumberOfSalesMan: allowedNumberOfSalesMan ?? this.allowedNumberOfSalesMan,
      numberOfSalesMan: numberOfSalesMan ?? this.numberOfSalesMan,
      subscriptionStartDate: subscriptionStartDate ?? this.subscriptionStartDate,
      subscriptionEndDate: subscriptionEndDate ?? this.subscriptionEndDate,
      subscription: subscription ?? this.subscription,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'password': password,
      'role': role,
      'id': id,
      'email': email,
      'phoneNumber': phoneNumber,
      // 'reference': reference,
      'delete': delete,
      'search': search,
      'createdTime': createdTime,
      'photoUrl': photoUrl,
      'status': status,
      'address': address.toJson(),
      'subscription': subscription,
      'subscriptionStartDate': subscriptionStartDate,
      'subscriptionEndDate': subscriptionEndDate,
      'numberOfSalesMan': numberOfSalesMan,
      'allowedNumberOfSalesMan': allowedNumberOfSalesMan,
      'usingFileStorage': usingFileStorage,
      'allowedFileStorage': allowedFileStorage,
    };
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      name: map['name'] ??"",
      password: map['password'] ??"",
      role: map['role'] ??"",
      id: map['id'] ??"",
      email: map['email'] ??"",
      phoneNumber: map['phoneNumber'] ??"",
      // reference: map['reference'] as DocumentReference,
      delete: map['delete'] ?? false,
      search:List<String>.from((map['search']),),
      createdTime: map['createdTime'].toDate(),
      photoUrl: map['photoUrl'] ??"",
      status: map['status'] ??0,
      address:Address.fromMap(map['address']),
      subscription: map['subscription'] ?? false,
      subscriptionStartDate: map['subscriptionStartDate'].toDate(),
      subscriptionEndDate: map['subscriptionEndDate'].toDate(),
      numberOfSalesMan: map['numberOfSalesMan'] ??0,
      allowedNumberOfSalesMan: map['allowedNumberOfSalesMan'] ??0,
      usingFileStorage: map['usingFileStorage'] ??0,
      allowedFileStorage: map['allowedFileStorage'] ??0,
    );
  }
}

/// Address Map class
class Address{
  final String city;
  final String district;
  final String state;
  final int pinCode;

  Address({
    required this.city,
    required this.state,
    required this.pinCode,
    required this.district
  });


  Address copyWith({
    String? city,
    String? state,
    String? district,
    int? pinCode,
  }) {
    return Address(
        city: city ??this.city,
        state: state??this.state,
        pinCode: pinCode??this.pinCode,
        district: district??this.district);
  }


  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'state': state,
      'pinCode': pinCode,
      'district': district,
    };
  }

  factory Address.fromMap(dynamic map) {
    return Address(
      city:map['city'] ??"",
      state:map['state']??"",
      pinCode: map['pinCode']??0,
      district:map['district']??"",
    );
  }

}