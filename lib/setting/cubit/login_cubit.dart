import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/setting/api/model.dart';

import '../api/dio.dart';
import '../api/endpoint.dart';
import '../cache.dart';
import '../const.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  ShopLoginModel? loginModel; //باخد object من model
  void userLogin({required String email, required String pass}) {
    emit(LoginLoadingState());
    DioHelper.post(
            url: loginEndpoint,
            data: {'email': email, 'password': pass},
            token: token)
        .then((value) {
      print(value.data);
      loginModel =
          ShopLoginModel.fromJson(value.data); //  مليت ال object الي خدته
      Cache.savaData(key: 'token', value: loginModel!.data.token);
      token = Cache.getData(key: 'token');
      print("*********************");
      print(loginModel!.data.token);
      print(loginModel?.message);
      emit(LoginSuccessState(loginModel: loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error: error.toString()));
    });
  }
}
