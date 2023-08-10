import 'package:flutter/cupertino.dart';
import 'package:shop_app/setting/size.dart';

import '../setting/api/categories-model.dart';

class OnBoardingWidget extends StatelessWidget {
  DataModel model;
  OnBoardingWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: NetworkImage(
              '${model.image}',
            ),
            height: 300,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${model.name}',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        30.h
      ],
    );
  }
}
