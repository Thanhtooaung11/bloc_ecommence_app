import 'dart:convert';

import 'package:bloc_ecommence_app/data/model/cart.dart';
import 'package:bloc_ecommence_app/data/model/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ///Search Products
  Future<List<ProductModel>> searchProduct(String uriPiece) async {
    List<ProductModel> products = [];

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    http.Request request =
        http.Request('GET', Uri.parse('https://dummyjson.com/$uriPiece'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String _data = await response.stream.bytesToString();
      Map _productsMap = json.decode(_data);
      // print(_productsMap);
      List _productMapList = _productsMap['products'];

      for (Map product in _productMapList) {
        products.add(ProductModel.fromJson(product));
      }

      // print(products);
      return products;
    } else if (response.statusCode == 400) {
      throw 'Bad request';
    } else {
      throw 'Something went wrong';
    }
  }

  //search order of user
  Future<List<Cart>> cart(String id) async {
    List<Cart> carts = [];

    http.Request request =
        http.Request('GET', Uri.parse('https://dummyjson.com/carts/user/$id'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String _result = await response.stream.bytesToString();
      Map _data = json.decode(_result);
      List<dynamic> _mapList = _data['carts'];
      // cart = Cart.fromJson(_mapList[0]);
      // print(_data);
      for (Map cart in _mapList) {
        carts.add(Cart.fromJson(cart));
      }
      print(carts);
      return carts;
    } else {
      throw 'Something went wrong!';
    }
  }
}
