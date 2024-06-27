import 'package:cloud_firestore/cloud_firestore.dart';

class ManagerModel{
  final String name;
  final String id;
  final String adminId;
  final String userType;
  final String emiratesId;
  final String email;
  final String password;
  final String phone;
  final String designation;
  final String address;
  final DocumentReference? reference;
  final bool delete;
  final List<String> search;
  final DateTime createdTime;
  final String image;
  final int status;

//<editor-fold desc="Data Methods">
  const ManagerModel({
    required this.name,
    required this.id,
    required this.adminId,
    required this.userType,
    required this.emiratesId,
    required this.email,
    required this.password,
    required this.phone,
    required this.designation,
    required this.address,
    this.reference,
    required this.delete,
    required this.search,
    required this.createdTime,
    required this.image,
    required this.status,
  });


  ManagerModel copyWith({
    String? name,
    String? id,
    String? adminId,
    String? userType,
    String? emiratesId,
    String? password,
    String? email,
    String? phone,
    String? designation,
    String? address,
    DocumentReference? reference,
    bool? delete,
    List<String>? search,
    DateTime? createdTime,
    String? image,
    int? status,
  }) {
    return ManagerModel(
      name: name ?? this.name,
      id: id ?? this.id,
      adminId: adminId ?? this.adminId,
      userType: userType ?? this.userType,
      password: password ?? this.password,
      emiratesId: emiratesId ?? this.emiratesId,
      email: email ?? this.email,
      phone:  phone?? this.phone,
      designation:designation  ?? this.designation,
      address:  address?? this.address,
      reference: reference ?? this.reference,
      delete: delete ?? this.delete,
      search: search ?? this.search,
      createdTime: createdTime ?? this.createdTime,
      image: image ?? this.image,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'adminId': adminId,
      'userType': userType,
      'password': password,
      'emiratesId': emiratesId,
      'email': email,
      'phone': phone,
      'designation': designation,
      'address': address,
      'reference': reference,
      'delete': delete,
      'search': search,
      'createdTime': createdTime,
      'image': image,
      'status': status,
    };
  }

  factory ManagerModel.fromMap(Map<String, dynamic> map) {
    return ManagerModel(
      name: map['name'] ??"",
      id: map['id'] ??"",
      adminId: map['adminId'] ??"",
      password: map['password'] ??"",
      userType: map['userType'] ??"",
      emiratesId: map['emiratesId'] ??"",
      email: map['email'] ??"",
      phone: map['phone'] ??"",
      designation: map['designation'] ??"",
      address: map['address'] ??"",
      reference: map['reference'] as DocumentReference,
      delete: map['delete']??"",
      search:List<String>.from((map['search']),),
      createdTime: map['createdTime'].toDate(),
      image: map['image'] ??"",
      status: map['status'] ??"",
    );
  }

//</editor-fold>
}