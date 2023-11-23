import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rpti_app/domain/entities/registro.dart';
import 'package:rpti_app/presentation/providers/busqueda_registros_provider.dart';
import 'package:rpti_app/presentation/providers/login_provider.dart';
import 'package:go_router/go_router.dart';


import 'package:rpti_app/presentation/widgets/shared/custom_bottom_navigation.dart';

class BusquedaScreen extends ConsumerWidget {
  static const String name = 'busqueda_screen';

  const BusquedaScreen({
    super.key,
  });

    @override
  Widget build(BuildContext context, WidgetRef ref) {

    String token = ref.watch(tokenProvider);

    final colors = Theme.of(context).colorScheme;

    final _fojaController = TextEditingController();
    final _rptiController = TextEditingController();
    final _anioController = TextEditingController();
    final _comunaController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Buscar inscripción",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: colors.primary,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: _fojaController,
                  decoration: const InputDecoration(
                    labelText: 'Ingrese foja RPTI',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: _rptiController,
                  decoration: const InputDecoration(
                    labelText: 'Ingrese número RPTI',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: _anioController,
                  decoration: const InputDecoration(
                    labelText: 'Ingrese año',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: _comunaController,
                  decoration: const InputDecoration(
                    labelText: 'Ingrese comuna',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () async{

                    print("Buscando...");

                    var data = FormData.fromMap({
                      'numero': _rptiController.text
                    });


                    final dio = Dio(BaseOptions(validateStatus: (status) => true));
                    final headers = {'Authorization': 'Bearer $token'};
                    try {

                      print("${dotenv.env['RPTI_API_URL']}/api/getdatosincripcion");

                      final response = await dio.request(
                          "${dotenv.env['RPTI_API_URL']}/api/getdatosincripcion",
                          options: Options(method: 'POST', headers: headers),
                          data: data);

                      if (response.statusCode != 200) {
                        throw Exception('La solicitud HTTP falló');
                      }

                      //Resuesta exitosa -> se convierte a tipo List de registros
                      if (response.statusCode == 200) {

                        List<Registro> listaRegistros = [];
                        
                        response.data['data'].forEach((e) {
                          var registro = Registro.fromJson(e);
                          listaRegistros.add(registro); 
                        });

                        ref.read(busquedaRegistrosProvider.notifier).state = listaRegistros;

                        context.replace('/resultado');
                      }


                    } catch (e) {
                      print(e);
                    }

                  },
                  child: const Text(
                    'Iniciar búsqueda',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () async {
                  },
                  child: const Text(
                    'Limpiar formulario',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}

