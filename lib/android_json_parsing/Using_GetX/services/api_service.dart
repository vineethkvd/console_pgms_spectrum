import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class ProductService {
  final String apiUrl = "https://fakestoreapi.com/products/1";

  Future<ProductsModel> getProduct() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      Map<String, dynamic> data = json.decode(response.body);
      return ProductsModel.fromJson(data);
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load product');
    }
  }
}
