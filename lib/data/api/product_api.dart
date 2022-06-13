import 'package:bloc_ecommence_app/data/api/api_service.dart';
import 'package:bloc_ecommence_app/data/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductApi extends ApiService {
  ProductApi._();

  static ProductApi? _instance;
  List<ProductModel> _allProducts = [];

  static get instance {
    _instance = _instance ?? ProductApi._();
    return _instance;
  }

  Future<List<ProductModel>> getAllProducts() async {
    if (_allProducts.isNotEmpty) {
      return _allProducts;
    }
    _allProducts = await searchProduct('products');
    return _allProducts;
  }

  Future<List<ProductModel>> getProductByCategory(String uriSchema) async {
    //https://dummyjson.com/products/category/smartphones
    return searchProduct(uriSchema);
  }
}
