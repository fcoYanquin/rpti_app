import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpti_app/domain/entities/registro.dart';
import 'package:rpti_app/presentation/providers/login_provider.dart';
import 'package:rpti_app/presentation/providers/registros_provider.dart';
import 'package:rpti_app/presentation/widgets/shared/custom_bottom_navigation.dart';
import 'package:go_router/go_router.dart';

class ListaRegistrosScreen extends ConsumerWidget {
  static const String name = 'lista_registros_screen';

  const ListaRegistrosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    List<Registro> registros = ref.watch(registrosProvider);
    String token = ref.watch(tokenProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Inscripciones desactualizadas",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: colors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
          itemCount: registros.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  //ref.read(registroProvider.notifier).state = "${registros[index].regId}";

                  context.replace('/registro/${registros[index].regId}/$token');
                  //print("Nueva pantalla");
                },
                child: Card(
                    elevation: 5,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            width: size.width * 0.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Comuna:",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Foja RPTI:",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Número RPTI:",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            width: size.width * 0.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  registros[index].comNombre,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${registros[index].regFojasRpti}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${registros[index].regNumeroRpti}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            width: (size.width - 320) * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Icon(Icons.keyboard_arrow_right),
                                const Text(
                                  "Año",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${registros[index].regAnioRpti}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            );
          }),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
