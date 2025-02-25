import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const SearchScaffold({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Este es un buscador'),
          SizedBox(height: 20),
          TextFormField(),
          SizedBox(height: 20),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.one_k), label: 'Nombre'),
          BottomNavigationBarItem(icon: Icon(Icons.two_k), label: 'Habilidad'),
        ],
        onTap: navigationShell.goBranch,
      ),
    );
  }
}
