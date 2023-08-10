import 'package:flutter/material.dart';
import 'package:shop_app/setting/api/categories-model.dart';

class CustomStack extends StatelessWidget {
  DataModel model;
  CustomStack({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.bottomCenter, children: [
      Image(
        image: NetworkImage('${model.image}'),
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      ),
      Container(
          color: Colors.black,
          width: 100,
          height: 20,
          child: Text(
            '${model.name}',
            style: const TextStyle(fontSize: 15, color: Colors.white),
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ))
    ]);
  }
}

class CustomText extends StatelessWidget {
  String text;
  CustomText({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}

class CustomDisCount extends StatelessWidget {
  String text;
  Color color;
  CustomDisCount({super.key, required this.text, required this.color});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
    );
  }
}
