import 'package:flutter/material.dart';

import 'src/router/router.dart';

void main() {
  runApp(const PokeApp());
}

class PokeApp extends StatelessWidget {
  const PokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Poke App',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
