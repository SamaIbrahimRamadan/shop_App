import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Screens/register/login.dart';
import 'package:shop_app/setting/const.dart';
import 'package:shop_app/setting/cubit/shop_cubit.dart';
import 'package:shop_app/widget/onBoarding-widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../setting/cache.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  bool isLast = false;
  var control = PageController();
  void submit() {
    Cache.savaData(key: 'onboard', value: true).then((value) {
      if (value) {
        navigator(context, const Login());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [TextButton(onPressed: submit, child: const Text("Skip"))],
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                        onPageChanged: (int index) {
                          // عشان اشوف وصلت ل نهايه ال pageView ولالا
                          if (index ==
                              ShopCubit.get(context)
                                      .categoriesModel!
                                      .data!
                                      .data!
                                      .length -
                                  1) {
                            setState(() {
                              isLast = true;
                              // عشان اقول ان وصلت خلاص لاخر page
                            });
                          } else {
                            setState(() {
                              isLast = false;
                            });
                          }
                        },
                        controller: control,
                        itemCount: ShopCubit.get(context)
                            .categoriesModel!
                            .data!
                            .data!
                            .length,
                        //boarding.length,
                        itemBuilder: (context, index) => OnBoardingWidget(
                            model: ShopCubit.get(context)
                                .categoriesModel!
                                .data!
                                .data![index])
                        // onBoardingItem(boarding[index])),
                        )),
                Row(
                  children: [
                    SmoothPageIndicator(
                      controller: control,
                      count: ShopCubit.get(context)
                          .categoriesModel!
                          .data!
                          .data!
                          .length,
                      //boarding.length,
                      effect: ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          activeDotColor: color,
                          dotHeight: 10, //ارتفاع الشكل
                          spacing: 5, // المسافه بينهم
                          expansionFactor: 3 // حجم بتاع الي واقف عنده
                          ),
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      backgroundColor: color,
                      onPressed: () {
                        if (isLast) {
                          submit();
                        } else {
                          control.nextPage(
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      },
                      child: const Icon(Icons.arrow_forward_ios),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
