import 'package:flutter/material.dart';

import 'package:anime_vault/ui/router/router_path.dart';
import 'package:anime_vault/ui/router/router.dart' as router;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Anime Vault',
      initialRoute: RouterPath.home,
      onGenerateRoute: router.generateRoute,
    );
  }
}
