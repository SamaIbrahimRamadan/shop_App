import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/setting/cubit/shop_cubit.dart';
import 'package:shop_app/setting/size.dart';

import '../setting/api/home-model.dart';
import 'custom-stack.dart';

class CustomProduct extends StatelessWidget {
  Products model;

  CustomProduct({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image(
                image: NetworkImage('${model.image}'),
                width: 120,
                height: 100,
              ),
              20.w,
              Text(
                ' ${model.name}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 15, height: 1.3, fontWeight: FontWeight.bold),
              ),
              20.h,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  CustomDisCount(
                    text: '${model.price}',
                    color: Colors.blueAccent,
                  ),
                  30.w,
                  const Spacer(),
                  IconButton(
                    icon: const CircleAvatar(
                      radius: 19,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(
                        Icons.favorite_border,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ]),
              ),
              model.discount != 0
                  ? CustomDisCount(
                      text: ' ${model.oldPrice}',
                      color: Colors.grey,
                    )
                  : const SizedBox(),
            ]),
          ),
        );
      },
    );
  }
}
