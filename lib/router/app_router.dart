import 'dart:typed_data';

import 'package:cocktails_app/blocs/detailsCocktail/details_cocktail_bloc.dart';
import 'package:cocktails_app/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../screens/screens.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
      path: '/details',
      builder: (context, state) {
        final details = state.extra as Map;
        return BlocProvider(
          create: (context) => DetailsCocktailBloc(details['id'] as int),
          child: DetailsCocktailScreen(
            id: details['id'],
          ),
        );
      }),
]);
