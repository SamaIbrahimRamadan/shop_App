import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/setting/size.dart';

import '../../setting/cache.dart';
import '../../setting/const.dart';
import '../../setting/cubit/sign_up_cubit.dart';
import '../../widget/button.dart';
import '../../widget/custom-stack.dart';
import '../../widget/register/text.dart';
import '../../widget/textField.dart';
import '../bottomNav/bottomNav.dart';
import 'login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var emailControl = TextEditingController();
    var passControl = TextEditingController();
    var nameControl = TextEditingController();
    var phoneControl = TextEditingController();
    final formKey1 = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            if (state.signUPModel.status) {
              print(state.signUPModel.message);
              Cache.savaData(key: 'token', value: state.signUPModel.data.token)
                  .then((value) {
                token = state.signUPModel.data.token;
                navigator(context, const BottomNav());
              });
              print(state.signUPModel.data.token);
            } else {
              print(state.signUPModel.message);
            }
          }
        },
        builder: (context, state) {
          var model = SignUpCubit.get(context).registerModel;
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey1,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Sign-up",
                        ),
                        30.h,
                        CustomDisCount(
                          text: 'Sign up now to browse our hot offers',
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
                        CustomTextField(
                          icon: Icons.lock_outline,
                          text: ' enter your name',
                          text1: 'name',
                          type: TextInputType.emailAddress,
                          control: nameControl,
                        ),
                        30.h,
                        CustomTextField(
                          icon: Icons.phone,
                          text: ' Enter your phone',
                          text1: 'Phone',
                          type: TextInputType.emailAddress,
                          control: phoneControl,
                        ),
                        30.h,
                        ConditionalBuilder(
                          condition: state is! SignUpLoading,
                          builder: (BuildContext context) {
                            return CustomButton(
                              text: 'Sign-up',
                              onPressed: () {
                                if (formKey1.currentState!.validate()) {
                                  SignUpCubit.get(context).userRegister(
                                      email: emailControl
                                          .text, // عشان ياخد القيمه الي دخلتها في فيلد و يقارنها ب الي متسجله عندي في api
                                      pass: passControl.text,
                                      name: nameControl.text,
                                      phone: phoneControl.text);
                                  Cache.savaData(
                                      key: 'token', value: model!.data.token);
                                  token = Cache.getData(key: 'token');
                                  navigator(context, const BottomNav());
                                }
                              },
                              color: color,
                              horizontal: 140,
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
                            text: "I have account",
                            text1: 'Login',
                            onPressed: () {
                              navigator(context, const Login());
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
