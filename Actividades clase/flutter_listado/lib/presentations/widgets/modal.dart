import 'package:flutter/material.dart';

void tapCharacter(BuildContext context, String name, String house, String age,
    String species) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Mostrando informacion de $name'),
              Text('Nombre: $name'),
              Text('Casa: $house'),
              Text('Edad: $age'),
              Text('Especie: $species'),
              ElevatedButton(
                child: const Text('Cerrar'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      );
    },
  );
}
