import 'package:flutter/material.dart';
import 'package:shop_app/setting/size.dart';
import 'package:shop_app/widget/custom-stack.dart';

import '../setting/api/categories-model.dart';

class CustomCategories extends StatelessWidget {
  DataModel model;
  CustomCategories({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Image(
                image: NetworkImage('${model.image}'),
                width: 100,
                height: 100,
              ),
              20.w,
              CustomText(text: '${model.name}'),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
          10.h,
          const CustomDivider(),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: .2,
      color: Colors.black38,
    );
  }
}
