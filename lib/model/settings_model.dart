class SettingSModel{
  final int adminId;
  final int categoryId;
  final int subCategoryId;
  final int productId;

//<editor-fold desc="Data Methods">
  const SettingSModel({
    required this.adminId,
    required this.categoryId,
    required this.subCategoryId,
    required this.productId,
  });

  SettingSModel copyWith({
    int? adminId,
    int? categoryId,
    int? subCategoryId,
    int? productId,
  }) {
    return SettingSModel(
      adminId: adminId ?? this.adminId,
      categoryId: categoryId ?? this.categoryId,
      subCategoryId: subCategoryId ?? this.subCategoryId,
      productId: productId ?? this.productId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'adminId': this.adminId,
      'categoryId': this.categoryId,
      'subCategoryId': this.subCategoryId,
      'productId': this.productId,
    };
  }

  factory SettingSModel.fromMap(Map<String, dynamic> map) {
    return SettingSModel(
      adminId: map['adminId'] as int,
      categoryId: map['categoryId'] as int,
      subCategoryId: map['subCategoryId'] as int,
      productId: map['productId'] as int,
    );
  }

//</editor-fold>
}