import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{
  final String productTitle;
  final String message;
  final String categoryId;
  final String id;
  final String subCategoryId;
  final DocumentReference? reference;
  final bool delete;
  final List<String> search;
  final DateTime createdTime;
  final DateTime publishDate;
  final DateTime restockDate;
  final List<String> images;
  final String status;
  final double initialCost;
  final double sellingPrice;
  final String productStock;
  final String discountType;
  final String stockAvailability;
  final String lowStock;
  final String sku;
  final double stockQuantity;
  final double discount;
  final String additionalTagTitle;
  final String specificTag;
  final String additionalDescription;


//<editor-fold desc="Data Methods">


  const ProductModel({
    required this.productTitle,
    required this.message,
    required this.categoryId,
    required this.id,
    required this.subCategoryId,
    this.reference,
    required this.delete,
    required this.search,
    required this.createdTime,
    required this.publishDate,
    required this.restockDate,
    required this.images,
    required this.status,
    required this.initialCost,
    required this.sellingPrice,
    required this.productStock,
    required this.discountType,
    required this.stockAvailability,
    required this.lowStock,
    required this.sku,
    required this.stockQuantity,
    required this.discount,
    required this.additionalTagTitle,
    required this.specificTag,
    required this.additionalDescription,
  });

  ProductModel copyWith({
    String? productTitle,
    String? message,
    String? categoryId,
    String? id,
    String? subCategoryId,
    DocumentReference? reference,
    bool? delete,
    List<String>? search,
    DateTime? createdTime,
    DateTime? publishDate,
    DateTime? restockDat,
    List<String>? images,
    String? status,
    double? initialCost,
    double? sellingPrice,
    String? productStock,
    String? discountType,
    String? stockAvailability,
    String? lowStock,
    String? sku,
    double? stockQuantity,
    double? discount,
    String? additionalTagTitle,
    String? specificTag,
    String? additionalDescription,
  }) {
    return ProductModel(
      productTitle: productTitle ?? this.productTitle,
      message: message ?? this.message,
      categoryId: categoryId ?? this.categoryId,
      id: id ?? this.id,
      subCategoryId: subCategoryId ?? this.subCategoryId,
      reference: reference ?? this.reference,
      delete: delete ?? this.delete,
      search: search ?? this.search,
      createdTime: createdTime ?? this.createdTime,
      publishDate: publishDate ?? this.publishDate,
      restockDate: restockDat ?? this.restockDate,
      images: images ?? this.images,
      status: status ?? this.status,
      initialCost: initialCost ?? this.initialCost,
      sellingPrice: sellingPrice ?? this.sellingPrice,
      productStock: productStock ?? this.productStock,
      discountType: discountType ?? this.discountType,
      stockAvailability: stockAvailability ?? this.stockAvailability,
      lowStock: lowStock ?? this.lowStock,
      sku: sku ?? this.sku,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      discount: discount ?? this.discount,
      additionalTagTitle: additionalTagTitle ?? this.additionalTagTitle,
      specificTag: specificTag ?? this.specificTag,
      additionalDescription: additionalDescription ??
          this.additionalDescription,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'productTitle': productTitle,
      'message': message,
      'categoryId': categoryId,
      'id': id,
      'subCategoryId': subCategoryId,
      'reference': reference,
      'delete': delete,
      'search': search,
      'createdTime': createdTime,
      'publishDate': publishDate,
      'restockDate': restockDate,
      'images': images,
      'status': status,
      'initialCost': initialCost,
      'sellingPrice': sellingPrice,
      'productStock': productStock,
      'discountType': discountType,
      'stockAvailability': stockAvailability,
      'lowStock': lowStock,
      'sku': sku,
      'stockQuantity': stockQuantity,
      'discount': discount,
      'additionalTagTitle': additionalTagTitle,
      'specificTag': specificTag,
      'additionalDescription': additionalDescription,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productTitle: map['productTitle']??"",
      message: map['message']??"",
      categoryId: map['categoryId']??"",
      id: map['id']??"",
      subCategoryId: map['subCategoryId']??"",
      reference: map['reference'] as DocumentReference,
      delete: map['delete'] ??false,
      search:List<String>.from((map['search']),),
      createdTime: map['createdTime'].toDate(),
      publishDate: map['publishDate'].toDate(),
      restockDate: map['restockDate'].toDate(),
      images:List<String>.from(map['images']),
      status: map['status']??"",
      initialCost: map['initialCost']??0,
      sellingPrice: map['sellingPrice']??0,
      productStock: map['productStock']??"",
      discountType: map['discountType']??"",
      stockAvailability: map['stockAvailability']??"",
      lowStock: map['lowStock']??"",
      sku: map['sku']??"",
      stockQuantity: map['stockQuantity']??0,
      discount: map['discount']??0,
      additionalTagTitle: map['additionalTagTitle']??"",
      specificTag: map['specificTag']??"",
      additionalDescription: map['additionalDescription']??"",
    );
  }


//</editor-fold>
}