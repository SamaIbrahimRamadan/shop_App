import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Screens/bottomNav/categories.dart';
import 'package:shop_app/Screens/bottomNav/product.dart';
import 'package:shop_app/Screens/bottomNav/setting.dart';
import 'package:shop_app/setting/api/categories-model.dart';
import 'package:shop_app/setting/api/endpoint.dart';
import 'package:shop_app/setting/api/profile-model.dart';

import '../api/dio.dart';
import '../api/home-model.dart';
import '../const.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());
  static ShopCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  void changeTheme() {
    isDark = !isDark;
    emit(ChangeThemeState());
  }

  int select = 0;
  void selectPage(int value) {
    select = value;
    emit(BottomNavState());
  }

  final pages = [
    const ProductScreen(),
    const CategoriesScreen(),
    SettingScreen(),
  ];
  HomeModel? homeModel;
  Future<void> getHomeData() async {
    emit(LoadingShopState());
    await DioHelper.get(
      url: homeEndpoint,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      emit(SuccessShopState());
      print(value.data['status']);
    }).catchError((e) {
      print(e.toString());
      emit(ErrorShopState());
    });
  }

  CategoriesModel? categoriesModel;
  Future<void> getCategoriesData() async {
    emit(LoadingCategoriesState());
    await DioHelper.get(url: categoriesEndpoint, token: token).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(SuccessCategoriesState());
      print(value.data['status']);
    }).catchError((e) {
      print(e.toString());
      emit(ErrorCategoriesState());
    });
  }

  ProfileModel? userModel;
  Future<void> getProfileData() async {
    emit(LoadingProfileState());
    await DioHelper.get(url: profileEndPoint, token: token).then((value) {
      userModel = ProfileModel.fromJson(value.data);
      emit(SuccessProfileState(userModel!));
      print(value.data['status']);
    }).catchError((e) {
      print(e.toString());
      emit(ErrorProfileState());
    });
  }
}
