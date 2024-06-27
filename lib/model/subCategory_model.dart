import 'package:cloud_firestore/cloud_firestore.dart';

class SubCategoryModel{
  final String name;
  final String categoryId;
  final String adminId;
  final String id;
  final DocumentReference? reference;
  final bool delete;
  final List<String> search;
  final DateTime createdTime;
  final String image;
  final int status;

//<editor-fold desc="Data Methods">
  const SubCategoryModel({
    required this.name,
    required this.categoryId,
    required this.adminId,
    required this.id,
    this.reference,
    required this.delete,
    required this.search,
    required this.createdTime,
    required this.image,
    required this.status,
  });

  SubCategoryModel copyWith({
    String? name,
    String? categoryId,
    String? adminId,
    String? id,
    DocumentReference? reference,
    bool? delete,
    List<String>? search,
    DateTime? createdTime,
    String? image,
    int? status,
  }) {
    return SubCategoryModel(
      name: name ?? this.name,
      categoryId: categoryId ?? this.categoryId,
      adminId: adminId ?? this.adminId,
      id: id ?? this.id,
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
      'categoryId': categoryId,
      'adminId': adminId,
      'id': id,
      'reference': reference,
      'delete': delete,
      'search': search,
      'createdTime': createdTime,
      'image': image,
      'status': status,
    };
  }

  factory SubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryModel(
      name: map['name'] ??"",
      categoryId: map['categoryId'] ??"",
      adminId: map['adminId'] ??"",
      id: map['id'] ??"",
      reference: map['reference'] as DocumentReference,
      delete: map['delete'] ??false,
      search:List<String>.from((map['search']),),
      createdTime: map['createdTime'].toDate(),
      image: map['image'] ??"",
      status: map['status']??0,
    );
  }

//</editor-fold>
}