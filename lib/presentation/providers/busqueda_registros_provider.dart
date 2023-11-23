import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpti_app/domain/entities/registro.dart';

final busquedaRegistrosProvider = StateProvider<List<Registro>>((ref) => []);