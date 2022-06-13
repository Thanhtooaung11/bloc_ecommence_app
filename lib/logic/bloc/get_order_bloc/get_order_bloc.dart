import 'package:bloc/bloc.dart';
import 'package:bloc_ecommence_app/data/api/cart_repository.dart';
import 'package:bloc_ecommence_app/data/model/cart.dart';
import 'package:meta/meta.dart';

part 'get_order_event.dart';
part 'get_order_state.dart';

class GetOrderBloc extends Bloc<GetOrderEvent, GetOrderState> {
  CartRepository repository;
  GetOrderBloc({required this.repository}) : super(GetOrderInitial()) {
    on<GetMyOrder>(getMyOrder);
  }
  getMyOrder(GetMyOrder event, Emitter emit) async {
    emit(GetOrderLoading());
    try {
      List<Cart> carts = await repository.getCart('5');
      emit(GetOrderSuccess(carts: carts));
    } catch (e) {
      print(e);
      emit(GetOrderFailed(message: e.toString()));
    }
  }
}
