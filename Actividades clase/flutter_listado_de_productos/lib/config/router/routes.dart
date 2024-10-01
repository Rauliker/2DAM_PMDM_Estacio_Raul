import 'package:flutter_listado_de_productos/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import 'products.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        }),
    GoRoute(
        path: '/simple_list',
        builder: (BuildContext context, GoRouterState state) {
          return const SimpleListView();
        }),
    GoRoute(
        path: '/complex_list',
        builder: (BuildContext context, GoRouterState state) {
          return ComplexListViewScreen();
        })
  ],
);
