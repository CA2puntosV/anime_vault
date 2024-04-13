import 'package:anime_vault/src/providers/auth_provider.dart';
import 'package:anime_vault/ui/views/auth/login_screen.dart';
import 'package:anime_vault/ui/views/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:anime_vault/ui/router/router_path.dart';
import 'package:anime_vault/src/models/anime_model.dart';
import 'package:anime_vault/ui/views/init/init_screen.dart';
import 'package:anime_vault/ui/views/home/home_screen.dart';
import 'package:anime_vault/src/providers/home_provider.dart';
import 'package:anime_vault/src/providers/search_provider.dart';
import 'package:anime_vault/ui/views/search/search_screen.dart';
import 'package:anime_vault/src/providers/details_provider.dart';
import 'package:anime_vault/ui/views/details/details_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;

  switch (settings.name) {
    // case RouterPath.splashRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const SizedBox(),
    //   );

    case RouterPath.init:
      return _buildRoute(
        settings: settings,
        builder: ChangeNotifierProvider(
          create: (_) => HomeProvider(),
          child: const InitScreen(),
        ),
      );

    case RouterPath.login:
      return _buildRoute(
        settings: settings,
        builder: ChangeNotifierProvider(
          create: (_) => UserAuthProvider(),
          child: const LoginScreen(),
        ),
      );

    case RouterPath.register:
      return _buildRoute(
        settings: settings,
        builder: ChangeNotifierProvider(
          create: (_) => UserAuthProvider(),
          child: const RegisterScreen(),
        ),
      );

    case RouterPath.home:
      return _buildRoute(
        settings: settings,
        builder: ChangeNotifierProvider(
          create: (_) => HomeProvider(),
          child: const HomeScreen(),
        ),
      );

    case RouterPath.search:
      return _buildRoute(
        settings: settings,
        builder: ChangeNotifierProvider(
          create: (_) => SearchProvider(),
          child: const SearchScreen(),
        ),
      );

    case RouterPath.details:
      final map = args as Map;

      return _buildRoute(
        settings: settings,
        builder: ChangeNotifierProvider(
          create: (_) => DetailsProvider(),
          child: DetailsScreen(
            anime: map['anime'] as AnimeModel,
          ),
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
