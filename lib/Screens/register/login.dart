import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Screens/register/sign_up.dart';
import 'package:shop_app/setting/const.dart';
import 'package:shop_app/setting/cubit/login_cubit.dart';
import 'package:shop_app/setting/size.dart';
import 'package:shop_app/widget/custom-stack.dart';
import 'package:shop_app/widget/register/text.dart';
import 'package:shop_app/widget/textField.dart';

import '../../setting/cache.dart';
import '../../widget/button.dart';
import '../bottomNav/bottomNav.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var emailControl = TextEditingController();
    var passControl = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.message == 'suce') {
              // لو ال status true يبقي عمل تسجيل دخول
              // لو عمل تسجيل دخول بنجاح بياخد token
              print(state.loginModel.message);
              Cache.savaData(key: 'token', value: state.loginModel.data.token)
                  .then((value) => navigator(context, const BottomNav()));
              print(state.loginModel.data.token);
            } else {
              // حصل مشكله في تسجيل الدخول
              print(state.loginModel.message);
            }
          }
        },
        builder: (context, state) {
          var model = LoginCubit.get(context).loginModel;
          // ;
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "LOGIN",
                        ),
                        30.h,
                        CustomDisCount(
                          text: 'Login now to browse our hot offers',
                          color: Colors.grey,
                        ),
                        30.h,
                        CustomTextField(
                          icon: Icons.email,
                          text: ' enter your email',
                          text1: 'email',
                          type: TextInputType.emailAddress,
                          control: emailControl,
                        ),
                        30.h,
                        CustomTextField(
                          icon: Icons.lock_outline,
                          text: ' enter your pass',
                          text1: 'pass',
                          type: TextInputType.emailAddress,
                          control: passControl,
                        ),
                        30.h,
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (BuildContext context) {
                            return CustomButton(
                              text: 'Login',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                      email: emailControl
                                          .text, // عشان ياخد القيمه الي دخلتها في فيلد و يقارنها ب الي متسجله عندي في api
                                      pass: passControl.text);
                                }
                              },
                              color: color,
                              horizontal: 160,
                              fontSize: 22,
                              color1: Colors.white,
                            );
                          },
                          fallback: (context) => const Center(
                              child:
                                  CircularProgressIndicator()), // الي هيتعرض والشرط غلط
                        ),
                        30.h,
                        CustomTextRegister(
                            text: "Don't have account",
                            text1: 'Sign Up',
                            onPressed: () {
                              navigator(context, const SignUp());
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
