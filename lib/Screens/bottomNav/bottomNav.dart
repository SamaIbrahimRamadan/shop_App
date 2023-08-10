import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/setting/cubit/shop_cubit.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: const [Icon(Icons.search)],
          ),
          body: ShopCubit.get(context).pages[ShopCubit.get(context).select],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: ShopCubit.get(context).select,
            onTap: ShopCubit.get(context).selectPage,
            items: const [
              BottomNavigationBarItem(
                  label: 'Product',
                  icon: Icon(
                    Icons.production_quantity_limits,
                    size: 35,
                  )),
              BottomNavigationBarItem(
                  label: 'category',
                  icon: Icon(
                    Icons.category,
                    size: 35,
                  )),
              BottomNavigationBarItem(
                  label: 'settings',
                  icon: Icon(
                    Icons.settings,
                    size: 35,
                  )),
            ],
          ),
        );
      },
    );
  }
}
