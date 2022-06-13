import 'package:bloc_ecommence_app/data/model/all_data.dart';
import 'package:bloc_ecommence_app/logic/bloc/fetch_product_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/constant.dart';

class AllProduct extends StatelessWidget {
  AllProduct({
    Key? key,

  }) : super(key: key);

  final DataStorage storage = DataStorage.instance;

  @override
  Widget build(BuildContext context) {
    // DataStorage storage = DataStorage.instance;
    // print(category);
    // if (category != 'all') {
    //   context
    //       .read<FetchProductBloc>()
    //       .add(FetchCategoryProduct(category: category));
    // } else {
    //   context.read<FetchProductBloc>().add(FetchAllProduct(category: category));
    // }

    context.read<FetchProductBloc>().add(FetchAllProduct(category: 'all'));

    print('built');

    return BlocBuilder<FetchProductBloc, FetchProductState>(
      // buildWhen: (pre, cur) {
      //   if (category == 'all') {
      //     return true;
      //   } else {
      //     return false;
      //   }
      // },
      builder: (context, state) {
        if (state is FetchProductSuccess) {
          return GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              state.products.length,
                  (index) => SizedBox(
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
                          state.products[index].thumbnail,
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
                                state.products[index].rating.toString(),
                              ),
                            ]),
                      ),
                    ),
                    Positioned(
                      bottom: 3,
                      left: 3,
                      child: Text(
                        '\$${state.products[index].price}',
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            mainAxisSpacing: 20,
            crossAxisSpacing: 30,
            childAspectRatio: 1.8,
          );
        } else if (state is FetchProductFailed) {
          return Center(
            child: Text(state.message),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}