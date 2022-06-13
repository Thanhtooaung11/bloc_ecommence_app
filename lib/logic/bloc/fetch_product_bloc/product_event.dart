part of 'product_bloc.dart';

@immutable
abstract class FetchProductEvent {}

class FetchAllProduct extends FetchProductEvent {
  final String category;

  FetchAllProduct({required this.category});
}

class FetchCategoryProduct extends FetchProductEvent {
  final String category;

  FetchCategoryProduct({required this.category});
}
