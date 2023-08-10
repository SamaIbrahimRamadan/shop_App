import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/setting/api/dio.dart';
import 'package:shop_app/setting/cache.dart';
import 'package:shop_app/setting/cubit/shop_cubit.dart';
import 'package:shop_app/style/theme.dart';

import 'Screens/register/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await Cache.init();
  //token = Cache.getData(key: 'token'); //put token
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()
        ..getHomeData()
        ..getCategoriesData()
        ..getProfileData(),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: light,
              darkTheme: dartTheme,
              themeMode: ShopCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: const Login());
        },
      ),
    );
  }
}
