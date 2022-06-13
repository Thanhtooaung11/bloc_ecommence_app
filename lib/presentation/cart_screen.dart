import 'package:bloc_ecommence_app/data/model/cart.dart';
import 'package:bloc_ecommence_app/logic/bloc/get_order_bloc/get_order_bloc.dart';
import 'package:bloc_ecommence_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GetOrderBloc>().add(GetMyOrder());
    // GetOrderState state = context.watch<GetOrderBloc>().state;
    return Scaffold(
        // backgroundColor: const Color.fromARGB(255, 27, 41, 53),
        backgroundColor: Colors.white.withOpacity(0.7),
        appBar: AppBar(
          title: const Text('Your Orders'),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          // automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<GetOrderBloc, GetOrderState>(
          builder: (context, state) {
            if (state is GetOrderSuccess) {
              List<Cart> carts = state.carts;

              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        // height: 200,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, 3),
                                blurRadius: 2,
                                spreadRadius: 2,
                              )
                            ]),
                        child: Column(
                            children: List.generate(carts[0].products!.length,
                                (index) {
                          return Column(
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Product',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Expanded(flex: 1, child: Text('-')),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      carts[0].products![index].title,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Price',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const Expanded(flex: 1, child: Text('-')),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      carts[0]
                                          .products![index]
                                          .price
                                          .toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Quantity',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const Expanded(flex: 1, child: Text('-')),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      carts[0]
                                          .products![index]
                                          .quantity
                                          .toString(),
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                                height: 30,
                              ),
                            ],
                          );
                        })),
                      )
                    ],
                  ),
                ),
              );
            } else if (state is GetOrderFailed) {
              return Center(
                child: Text(state.message),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
