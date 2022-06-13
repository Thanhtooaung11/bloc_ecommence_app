
import 'package:bloc_ecommence_app/data/model/user_model.dart';
import 'package:bloc_ecommence_app/presentation/screens/home/components/custom_tabbar.dart';
import 'package:bloc_ecommence_app/utils/constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_search_bar.dart';
import 'components/all_product_view.dart';
import 'components/category_product_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  ///smartphones/laptops/skincare/furniture/mens-wathces/motorcycle
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
    // print(widget.user.token);
  }

  @override
  Widget build(BuildContext context) {
    // context.read<FetchProductBloc>().add(FetchAllProduct(category: 'all'));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 20,
          splashColor: primaryColor,
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            splashColor: primaryColor,
            splashRadius: 20,
            onPressed: () {
              Navigator.pushNamed(context, appCartScreen);
            },
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
          IconButton(
            splashColor: primaryColor,
            splashRadius: 20,
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_outlined,
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: appDefaultPadding),
          child: Column(
            children: [
              const CustomSearchBar(),
              const SizedBox(height: 10),
              CustomTabBar(tabController: _tabController),
              const SizedBox(height: 10),

              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  dragStartBehavior: DragStartBehavior.down,
                  children: [
                    AllProduct(),

                    CategoryProduct(category: categroies[1]),
                    // CustomTabBarView(),
                    CategoryProduct(category: categroies[2]),
                    CategoryProduct(category: categroies[3]),
                    CategoryProduct(category: categroies[4]),
                    CategoryProduct(category: categroies[5]),
                  ],
                ),
              ),

              // child: AllProduct(),
            ],
          ),
        ),
      ),
    );
  }
}



