import 'dart:convert';

import 'package:http/http.dart';
import 'package:psp_final_windows/models/product_response.dart';

class ProductService {
  Future<Product> postProducts(Product product) async {
    print(json.encode(product.toMap()));
    print(Uri.parse('http://3.93.152.48:8080/api/productos'));
    final resp = await post(Uri.parse('http://3.93.152.48:8080/api/productos'),
        headers: {
          'Content-Type': 'application/json',
          "Access-Control-Allow-Origin":
              "*", // Required for CORS support to work
          "Access-Control-Allow-Credentials":
              "true", // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers":
              "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods": "POST, OPTIONS"
        },
        body: json.encode(product.toMap()));
    print(resp.body);
    Product producto = Product.fromJson(resp.body);
    return producto;
  }
}
