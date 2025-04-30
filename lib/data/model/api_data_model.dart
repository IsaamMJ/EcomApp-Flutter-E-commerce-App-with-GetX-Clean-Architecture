import 'package:ecomapp/domain/entities/api_data_entities.dart';

class ApiDataModel extends ApiDataEntity {
  ApiDataModel({
    required int id,
    required String imageUrl,
    required String product_name,
    required String price,
  }) : super(id: id, imageUrl: imageUrl, product_name: product_name,price: price );

  factory ApiDataModel.fromJson(Map<String, dynamic> json) {
    return ApiDataModel(
      id: json['id'],
      imageUrl: json['imageUrl'],
      product_name: json['product_name'],
      price: json['price'],
    );
  }
}
