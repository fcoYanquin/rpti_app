import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpti_app/domain/entities/login.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginApi {
  Future<Login> getDatalogin() async {
    final dio = Dio(BaseOptions(validateStatus: (status) => true));
    final response = await dio.request(
        "${dotenv.env['RPTI_API_URL']}/api/auth/login?email=registro@mail.com&password=eiT55fAJWd",
        options: Options(method: 'POST'));

    print("response desde apiLogin");
    print(response);

    var login = Login.fromJson(response.data);

    return login;
  }
}

final loginProvider = Provider<LoginApi>((ref) => LoginApi());
