import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/setting/cubit/shop_cubit.dart';
import 'package:shop_app/widget/textField.dart';

import '../../setting/const.dart';
import '../../widget/button.dart';

class SettingScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ShopCubit.get(context).userModel;
        nameController.text = model!.data!.name ?? '';
        phoneController.text = model.data!.phone ?? '';
        emailController.text = model.data!.email ?? '';
        return ConditionalBuilder(
            condition: ShopCubit.get(context).userModel != null,
            builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomTextField(
                          control: nameController,
                          text: 'name',
                          text1: 'name',
                          type: TextInputType.text,
                          icon: Icons.person),
                      CustomTextField(
                          control: emailController,
                          text: 'email',
                          text1: 'email',
                          type: TextInputType.emailAddress,
                          icon: Icons.email),
                      CustomTextField(
                          control: phoneController,
                          text: 'password',
                          text1: 'password',
                          type: TextInputType.phone,
                          icon: Icons.phone),
                      CustomButton(
                        text: 'log out',
                        onPressed: () {
                          signOut(context);
                        },
                        color: color,
                        horizontal: 140,
                        fontSize: 22,
                        color1: Colors.white,
                      ),
                    ],
                  ),
                ),
            fallback: (BuildContext context) =>
                const CircularProgressIndicator());
      },
    );
  }
}
