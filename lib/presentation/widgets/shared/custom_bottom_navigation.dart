import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rpti_app/presentation/providers/login_provider.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;

            switch (value) {
              case 0:
                context.replace('/home/123');
                break;
              case 1:
                context.replace('/busqueda');
                break;
              case 2:
                context.replace('/login');
                break;
              default:
            }
          });
        },
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: "Inicio",
              backgroundColor: colors.primary),
          BottomNavigationBarItem(
              icon: const Icon(Icons.search),
              label: "Buscar",
              backgroundColor: colors.primary),
          BottomNavigationBarItem(
              icon: const Icon(Icons.exit_to_app),
              label: "Salir",
              backgroundColor: colors.error),
        ]);
  }
}
