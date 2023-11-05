import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rpti_app/presentation/providers/login_provider.dart';
import 'package:rpti_app/presentation/providers/registro_provider.dart';

import 'package:rpti_app/presentation/widgets/shared/custom_bottom_navigation.dart';

class BusquedaScreen extends ConsumerStatefulWidget {
  static const String name = 'busqueda_screen';

  const BusquedaScreen({
    super.key,
  });

  @override
  BusquedaScreenState createState() => BusquedaScreenState();
}

class BusquedaScreenState extends ConsumerState<BusquedaScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () async {},
                  child: const Text(
                    'Iniciar búsqueda',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () async {},
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
