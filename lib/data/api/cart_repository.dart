import 'package:bloc_ecommence_app/data/api/api_service.dart';
import 'package:bloc_ecommence_app/data/model/cart.dart';

class CartRepository extends ApiService {
  Future<List<Cart>> getCart(String id) => cart(id);
}
