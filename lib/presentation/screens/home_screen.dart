import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpti_app/presentation/providers/registros_provider.dart';
import 'package:rpti_app/presentation/widgets/shared/custom_bottom_navigation.dart';
import 'package:go_router/go_router.dart';
import 'package:rpti_app/presentation/widgets/shared/custom_loading_animatios.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String name = 'home_screen';

  final String token;

  const HomeScreen({super.key, required this.token});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(registrosProvider.notifier).addRegistros(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final registros = ref.watch(registrosProvider);

    for (var registro in registros) {
      print("Id registro ${registro.regId}");
    }

    if (registros.isEmpty) {
      return const CustomLoadingAnimation();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenido",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: colors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: _Cards(
          color: colors.primary,
          registros: registros,
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}

class _Cards extends StatelessWidget {
  final Color color;
  final List registros;

  const _Cards({required this.color, required this.registros});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        _CardRegistrosDesactualizados(
          color: color,
          registros: registros,
        ),
        _CardBusquedaRegistros(
          color: color,
        ),
      ],
    ));
  }
}

class _CardRegistrosDesactualizados extends StatelessWidget {
  final Color color;
  final List registros;

  const _CardRegistrosDesactualizados(
      {required this.color, required this.registros});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(
                          0.5), // Ajusta la opacidad para oscurecer la imagen
                      BlendMode.darken,
                    ),
                    child: Image.asset(
                      "assets/images/Registro-contable-1.webp",
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Actualizar registros',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
          ListTile(
            title: const Text(
              'Registros desactualizados',
              style: TextStyle(fontSize: 20),
            ),
            trailing: Text(
              "${registros.length}",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              "Estos registros necesitan su atención",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                context.push('/registros');
              },
              style: TextButton.styleFrom(
                  backgroundColor: color,
                  minimumSize: Size(MediaQuery.of(context).size.width, 40)),
              child: const Text(
                'Revisar',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CardBusquedaRegistros extends StatelessWidget {
  final Color color;

  const _CardBusquedaRegistros({required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(
                          0.5), // Ajusta la opacidad para oscurecer la imagen
                      BlendMode.darken,
                    ),
                    child: Image.asset(
                      "assets/images/2021022017562719915.jpg",
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Búsqueda de registros',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
          const ListTile(
            title: Text(
              'Registros totales',
              style: TextStyle(fontSize: 20),
            ),
            trailing: Text(
              '159999',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Registros existentes en el sistema",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                context.push('/busqueda');
              },
              style: TextButton.styleFrom(
                  backgroundColor: color,
                  minimumSize: Size(MediaQuery.of(context).size.width, 40)),
              child: const Text(
                'Nueva búsqueda',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
