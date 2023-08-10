import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/setting/api/home-model.dart';
import 'package:shop_app/setting/cubit/shop_cubit.dart';
import 'package:shop_app/widget/productWidget.dart';

import '../../setting/api/categories-model.dart';
import '../../widget/custom-stack.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: ShopCubit.get(context).homeModel != null &&
                ShopCubit.get(context).categoriesModel != null,
            builder: (context) => productBuilder(
                ShopCubit.get(context).homeModel!,
                ShopCubit.get(context).categoriesModel!,
                context),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget productBuilder(HomeModel model, CategoriesModel model1, context) =>
      SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            CarouselSlider(
                items: model.data!.banners!
                    .map((e) => Image(
                          image: NetworkImage(
                            '${e.image}',
                          ),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
                options: CarouselOptions(
                    height: 200,
                    initialPage: 0,
                    autoPlay: true,
                    viewportFraction:
                        1, // عشان صوره واحده تتعرض في المره الواحده
                    scrollDirection: Axis.horizontal,
                    autoPlayCurve: Curves.fastOutSlowIn, // الشكل الحركه
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    autoPlayInterval:
                        const Duration(seconds: 3), //هيقغد اد اي ويقلب
                    enableInfiniteScroll: true,
                    reverse: false)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Categories'),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => CustomStack(
                              model: model1.data!.data![index],
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 20,
                            ),
                        itemCount: model1.data!.data!.length),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(text: 'Products'),
                ],
              ),
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                  mainAxisSpacing: 2, // المسافه فوق وتحت
                  crossAxisSpacing: 2, // المسافه يمين وشمال
                  childAspectRatio: 1.1 / 1.6, // نسبه العرض ل طول
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2, // هيبقي في حاجتين جمب بعض
                  children: List.generate(
                      model.data!.products!.length,
                      (index) =>
                          CustomProduct(model: model.data!.products![index]))),
            ),
          ]));
}
