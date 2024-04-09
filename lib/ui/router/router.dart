import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:anime_vault/ui/views/home/home_screen.dart';
import 'package:anime_vault/ui/router/router_path.dart';
import 'package:anime_vault/src/providers/home_provider.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // final args = settings.arguments;

  switch (settings.name) {
    // case RouterPath.splashRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const SizedBox(),
    //   );

    case RouterPath.home:
      return _buildRoute(
        settings: settings,
        builder: ChangeNotifierProvider(
          create: (_) => HomeProvider(),
          child: const HomeScreen(),
        ),
      );

    default:
      return _errorRoute();
  }
}

MaterialPageRoute _buildRoute({
  required RouteSettings settings,
  required Widget builder,
}) {
  return MaterialPageRoute(
    settings: settings,
    builder: (_) => AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: builder,
    ),
  );
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: const Center(
          child: Text(''),
        ),
      );
    },
  );
}
