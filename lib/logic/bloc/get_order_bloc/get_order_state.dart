part of 'get_order_bloc.dart';

@immutable
abstract class GetOrderState {}

class GetOrderInitial extends GetOrderState {}

class GetOrderLoading extends GetOrderState {}

class GetOrderSuccess extends GetOrderState {
  final List<Cart> carts;

  GetOrderSuccess({required this.carts});
}

class GetOrderFailed extends GetOrderState {
  final String message;
  GetOrderFailed({required this.message});
}
