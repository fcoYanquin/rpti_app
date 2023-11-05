import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rpti_app/domain/entities/login.dart';
import 'package:rpti_app/presentation/providers/login_provider.dart';

class LoginScreen extends ConsumerWidget {
  static const String name = 'login_screen';
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(tokenProvider);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                width: 200,
                height: 200,
                child:
                    Image(image: AssetImage('assets/images/conadi-logo.png')),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 15, 30, 25),
                child: Text(
                  'Registro   Público   de  Tierras Indígenas',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Colors.black54),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre de usuario',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                  ),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () async {
                    final dio =
                        Dio(BaseOptions(validateStatus: (status) => true));
                    final response = await dio.request(
                        "${dotenv.env['RPTI_API_URL']}/api/auth/login?email=${dotenv.env['RPTI_API_USUARIO']}&password=${dotenv.env['RPTI_API_PASSWORD']}",
                        options: Options(method: 'POST'));

                    if (response.statusCode == 200) {
                      var loginData = Login.fromJson(response.data);

                      ref.read(tokenProvider.notifier).state =
                          loginData.accessToken;
                      // ignore: use_build_context_synchronously
                      context.replace('/home/${loginData.accessToken}');
                    }
                  },
                  child: const Text(
                    'Iniciar sesión',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
