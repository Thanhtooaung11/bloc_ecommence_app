import 'package:bloc_ecommence_app/data/model/all_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/product_model.dart';
import '../../../../logic/bloc/fetch_product_bloc/product_bloc.dart';
import '../../../../utils/constant.dart';

class CategoryProduct extends StatelessWidget {
  final String category;
  const CategoryProduct({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<FetchProductBloc>().add(FetchAllProduct(category: category));

    List<ProductModel> products;

    // print(storage.smartPhones);
    return BlocBuilder<FetchProductBloc, FetchProductState>(
      builder: (context, state) {
        if (state is FetchProductSuccess) {
          products = state.products
              .where((product) => product.category == category)
              .toList();
          return GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              products.length,
              (index) => Container(
                width: 160,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 200,
                      // height: 100,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.3),
                              offset: const Offset(0, 5),
                              blurRadius: 3,
                            )
                          ]),

                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: Image.network(
                          products[index].thumbnail,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        // width: 30,
                        height: 20,
                        color: Colors.white,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                color: primaryColor,
                                size: 16,
                              ),
                              Text(
                                products[index].rating.toString(),
                              ),
                            ]),
                      ),
                    ),
                    Positioned(
                      bottom: 3,
                      left: 3,
                      child: Text(
                        '\$${products[index].price}',
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            mainAxisSpacing: 20,
            crossAxisSpacing: 30,
            childAspectRatio: 1.8,
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
