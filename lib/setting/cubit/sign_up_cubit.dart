import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/setting/api/endpoint.dart';
import '../const.dart';
import '../api/dio.dart';
import '../api/model.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);
  ShopLoginModel? registerModel;
  void userRegister(
      {required String email,
      required String pass,
      required String name,
      required String phone}) {
    emit(SignUpLoading());
    DioHelper.post(url: registerEndPoint,token: token, data: {
      'email': email,
      'password': pass,
      'name': name,
      'phone': phone,

    }).then((value) {
      print(value.data);
      registerModel =
          ShopLoginModel.fromJson(value.data); //  مليت ال object الي خدته
      print(registerModel?.message);
      emit(SignUpSuccess(signUPModel: registerModel!));
    }).catchError((error) {
      print(error.toString());
      emit(SignUpError(error: error.toString()));
    });
  }
}
