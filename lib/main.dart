import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/di/injection.dart';
import 'src/router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await configureModuleDependencies();
  runApp(const PokeApp());
}

class PokeApp extends StatelessWidget {
  const PokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Poke App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
        appBarTheme: AppBarTheme(color: Colors.red),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
