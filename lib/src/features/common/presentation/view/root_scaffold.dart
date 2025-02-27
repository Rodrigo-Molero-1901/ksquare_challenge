import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const RootScaffold({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Poke App', style: TextStyle(color: Colors.white)),
      ),
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Buscar'),
        ],
        onTap: navigationShell.goBranch,
      ),
    );
  }
}
