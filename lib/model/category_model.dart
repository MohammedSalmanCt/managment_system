import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  final String categoryName;
  final String id;
  final String adminId;
  final DocumentReference? reference;
  final bool delete;
  final List<String> search;
  final DateTime createdTime;
  final String image;
  final int status;

//<editor-fold desc="Data Methods">
  const CategoryModel({
    required this.categoryName,
    required this.id,
    required this.adminId,
    this.reference,
    required this.delete,
    required this.search,
    required this.createdTime,
    required this.image,
    required this.status,
  });


  CategoryModel copyWith({
    String? categoryName,
    String? id,
    String? adminId,
    DocumentReference? reference,
    bool? delete,
    List<String>? search,
    DateTime? createdTime,
    String? image,
    int? status,
  }) {
    return CategoryModel(
      categoryName: categoryName ?? this.categoryName,
      id: id ?? this.id,
      adminId: adminId ?? this.adminId,
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
      'categoryName': categoryName,
      'id': id,
      'adminId': adminId,
      'reference': reference,
      'delete': delete,
      'search': search,
      'createdTime': createdTime,
      'image': image,
      'status': status,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryName: map['categoryName'] ??"",
      id: map['id'] ??"",
      adminId: map['adminId'] ??"",
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