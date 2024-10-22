import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_listado/presentations/bloc/users/login_bloc.dart';
import 'package:flutter_listado/presentations/bloc/users/login_event.dart';
import 'package:go_router/go_router.dart';

void dialogLogout(BuildContext context) {
  final loginBloc = context.read<LoginBloc>();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Cerrar sesión'),
        content: const Text('¿Estás seguro de que deseas cerrar sesión?'),
        actions: [
          ElevatedButton(
            onPressed: () {
              loginBloc.add(LogoutButtonPressed());
              Navigator.of(context).pop(); // Cierra el diálogo
              context.go('/login'); // Navega a la pantalla de login
            },
            child: const Text('Aceptar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cierra el diálogo
            },
            child: const Text('Cancelar'),
          ),
        ],
      );
    },
  );
}
