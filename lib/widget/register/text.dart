import 'package:flutter/material.dart';

import '../../setting/const.dart';

class CustomTextRegister extends StatelessWidget {
  String text, text1;
  void Function() onPressed;
  CustomTextRegister(
      {super.key,
      required this.text,
      required this.text1,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            text1,
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(color: color),
          ),
        )
      ],
    );
  }
}
