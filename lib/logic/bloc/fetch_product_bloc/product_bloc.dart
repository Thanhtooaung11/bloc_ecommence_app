import 'package:bloc/bloc.dart';
import 'package:bloc_ecommence_app/data/api/product_api.dart';
import 'package:bloc_ecommence_app/data/model/product_model.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class FetchProductBloc extends Bloc<FetchProductEvent, FetchProductState> {
  final ProductApi productApi;

  FetchProductBloc({required this.productApi}) : super(FetchProductLoading()) {
    on<FetchAllProduct>(fetchAllProduct);
    // on<FetchCategoryProduct>(fetchCategoryProduct);
  }

  fetchAllProduct(
      FetchAllProduct event, Emitter<FetchProductState> emit) async {
    emit(FetchProductLoading());

    try {
      List<ProductModel> _products = await productApi.getAllProducts();
      // print(_products);
      emit(FetchProductSuccess(products: _products, category: event.category));
    } catch (e) {
      print(e);
      emit(FetchProductFailed(message: e.toString()));
    }
  }


}
