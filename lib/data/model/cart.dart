import 'package:bloc_ecommence_app/data/model/product_model.dart';
import 'package:flutter/material.dart';

class Cart {
  final int id;
  final List<CartProduct>? products;
  final double total;
  final double discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  Cart({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory Cart.fromJson(Map data) {
    List<CartProduct> _carts = [];
    if (data['products'] != null) {
      List<dynamic> result = data['products'];
      _carts.addAll(result.map((e) => CartProduct.fromJson(e)).toList());
    }
    return Cart(
      id: data['id'],
      products: _carts,
      total: double.tryParse(data['total'].toString())!,
      discountedTotal: double.tryParse(data['discountedTotal'].toString())!,
      userId: data['userId'],
      totalProducts: data['totalProducts'],
      totalQuantity: data['totalQuantity'],
    );
  }
}

// "id": 43,
//                     "title": "frock gold printed",
//                     "price": 600,
//                     "quantity": 3,
//                     "total": 1800,
//                     "discountPercentage": 15.55,
//                     "discountedPrice": 1520

class CartProduct {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final double total;
  final double discountPercentage;
  final double discountedPrice;

  CartProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedPrice,
  });

  factory CartProduct.fromJson(Map data) {
    return CartProduct(
      id: data['id'],
      title: data['title'],
      price: double.tryParse(data['price'].toString())!,
      quantity: data['quantity'],
      total: double.tryParse(data['total'].toString())!,
      discountPercentage:
          double.tryParse(data['discountPercentage'].toString())!,
      discountedPrice: double.tryParse(data['discountedPrice'].toString())!,
    );
  }
}
