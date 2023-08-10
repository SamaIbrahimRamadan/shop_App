import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/widget/categories-widget.dart';

import '../../setting/cubit/shop_cubit.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (context, index) => CustomCategories(
                model:
                    ShopCubit.get(context).categoriesModel!.data!.data![index]),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 30,
                ),
            itemCount:
                ShopCubit.get(context).categoriesModel!.data!.data!.length);
      },
    );
  }
}
