import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpti_app/domain/entities/registro.dart';

class RegistrosNotifier extends StateNotifier<List<Registro>> {
  RegistrosNotifier() : super([]);

  Future<void> addRegistros(String token) async {
    final dio = Dio(BaseOptions(validateStatus: (status) => true));
    final headers = {'Authorization': 'Bearer $token'};
    try {
      final response = await dio.request(
          "${dotenv.env['RPTI_API_URL']}/api/getdatosinscripcionesdescatualizadas",
          options: Options(method: 'POST', headers: headers));

      if (response.statusCode != 200) {
        throw Exception('La solicitud HTTP falló');
      }

      response.data['data'].forEach((e) {
        var registro = Registro.fromJson(e);
        state = [...state, registro];
      });
    } catch (e) {
      print(e);
    }
  }
}

final registrosProvider =
    StateNotifierProvider<RegistrosNotifier, List<Registro>>((ref) {
  return RegistrosNotifier();
});
