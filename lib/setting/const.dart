import 'package:flutter/material.dart';

import '../Screens/register/login.dart';
import 'cache.dart';

Color color = Colors.blueAccent;

void navigator(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
String token = '';
void signOut(context) {
  Cache.clearData(key: 'token')
      .then((value) => navigator(context, const Login()));
}
