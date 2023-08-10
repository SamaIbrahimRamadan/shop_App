part of 'shop_cubit.dart';

abstract class ShopState {}

class ShopInitial extends ShopState {}

class ChangeThemeState extends ShopState {}

class BottomNavState extends ShopState {}

class SuccessShopState extends ShopState {}

class LoadingShopState extends ShopState {}

class ErrorShopState extends ShopState {}

class SuccessProfileState extends ShopState {
  final ProfileModel loginModel;
  SuccessProfileState(this.loginModel);
}

class LoadingProfileState extends ShopState {}

class ErrorProfileState extends ShopState {}

class SuccessCategoriesState extends ShopState {}

class LoadingCategoriesState extends ShopState {}

class ErrorCategoriesState extends ShopState {}
