import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpti_app/domain/entities/registro.dart';

class RegistroNotifier extends StateNotifier<Map<String, Registro>> {
  RegistroNotifier() : super({});

  Future<void> getRegistro(String token, String id) async {
    final dio = Dio(BaseOptions(validateStatus: (status) => true));
    final headers = {'Authorization': 'Bearer $token'};

    var formData = FormData.fromMap({
      "id": id,
    });

    try {
      final response = await dio.request(
          "${dotenv.env['RPTI_API_URL']}/api/getinscrinscripcion",
          options: Options(method: 'POST', headers: headers),
          data: formData);

      if (response.statusCode != 200) {
        throw Exception('La solicitud HTTP falló');
      }

      var registro = Registro.fromJson(response.data['data'][0]);
      state = {...state, id: registro};
    } catch (e) {
      print(e);
    }
  }
}

final registroProvider =
    StateNotifierProvider<RegistroNotifier, Map<String, Registro>>((ref) {
  return RegistroNotifier();
});
