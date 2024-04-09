import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // final args = settings.arguments;

  switch (settings.name) {
    // case RouterPath.splashRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const SizedBox(),
    //   );

    // case RouterPath.homeRoute:
    //   return _buildRoute(
    //     settings: settings,
    //     builder: ChangeNotifierProvider(
    //       create: (_) => HomeBloc(),
    //       child: const HomeScreen(),
    //     ),
    //   );

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
