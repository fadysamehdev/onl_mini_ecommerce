import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onl_mini_ecommerce/product_model.dart';
class ProductService {
  final String baseUrl = 'https://dummyjson.com/';
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl//products'));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      List products = data['products'];
      return products.map((e)=> Product.fromJson(e)).toList();
    }else{
      throw Exception("Failed to load products");
    }
    


  }
}