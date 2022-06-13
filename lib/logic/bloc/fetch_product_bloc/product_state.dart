part of 'product_bloc.dart';

@immutable
abstract class FetchProductState {}

class ProductInitial extends FetchProductState {}

class FetchProductLoading extends FetchProductState {}

class FetchProductSuccess extends FetchProductState {
  final List<ProductModel> products;
  final String category;

  FetchProductSuccess({required this.products, required this.category});
}

class FetchProductFailed extends FetchProductState {
  final String message;

  FetchProductFailed({required this.message});
}
