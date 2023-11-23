import 'package:go_router/go_router.dart';
import 'package:rpti_app/presentation/screens/busqueda_screen.dart';
import 'package:rpti_app/presentation/screens/login/login_screen.dart';
import 'package:rpti_app/presentation/screens/home_screen.dart';
import 'package:rpti_app/presentation/screens/lista_registros_screen.dart';
import 'package:rpti_app/presentation/screens/registro_screen.dart';
import 'package:rpti_app/presentation/screens/resultado_inscripcion_screen.dart';
import 'package:rpti_app/presentation/screens/scanner_screen.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      name: LoginScreen.name,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/home/:token',
      name: HomeScreen.name,
      builder: (context, state) {
        final token = state.pathParameters['token'].toString();
        return HomeScreen(token: token);
      },
    ),
    GoRoute(
      path: '/registro/:id/:token',
      name: RegistroScreen.name,
      builder: (context, state) {
        final id = state.pathParameters['id'].toString();
        final token = state.pathParameters['token'];
        return RegistroScreen(id: id, token: token!);
      },
    ),
    GoRoute(
      path: '/registros',
      name: ListaRegistrosScreen.name,
      builder: (context, state) => const ListaRegistrosScreen(),
    ),
    GoRoute(
      path: '/busqueda',
      name: BusquedaScreen.name,
      builder: (context, state) => const BusquedaScreen(),
    ),
    GoRoute(
      path: '/escaner',
      name: ScannerScreen.name,
      builder: (context, state) => const ScannerScreen(),
    ),
    GoRoute(
      path: '/resultado',
      name: ResultadoInscripcionScreen.name,
      builder: (context, state) => const ResultadoInscripcionScreen(),
    ),

  ],
);
