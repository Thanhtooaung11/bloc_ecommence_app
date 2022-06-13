import 'package:bloc_ecommence_app/data/model/product_model.dart';

class DataStorage {
  DataStorage._();

  static DataStorage? _instance;

  static get instance {
    _instance = _instance ?? DataStorage._();
    return _instance;
  }

  List<ProductModel> smartPhones = [];
  List<ProductModel> skincare = [];
  List<ProductModel> laptops = [];
  List<ProductModel> furniture = [];
  List<ProductModel> mensWatches = [];

  // Map<String, List<ProductModel>> data = {
  //   'smart\nphones': smartPhones,
  //   'skincare': skincare,
  //   'laptops': laptops,
  //   'furniture': furniture,
  //   'mens\nwatches': mensWatches,
  // };
}
