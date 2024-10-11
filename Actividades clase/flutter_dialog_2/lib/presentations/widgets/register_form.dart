import 'package:flutter/material.dart';
import '../../infraestructure/models/usuario.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String? _nombre;
  String? _apellidos;
  int? _edad;
  String? _correo;
  String? _sexo;
  final List<String> _aficiones = [];

  final List<String> _opcionesAficiones = [
    'Deportes',
    'Lectura',
    'Cocinar',
    'Videojuegos',
    'Viajar'
  ];

  void _registrarUsuario() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // ignore: unused_local_variable
      Usuario usuario = Usuario(
        nombre: _nombre!,
        apellidos: _apellidos!,
        edad: _edad!,
        correo: _correo!,
        sexo: _sexo!,
        aficiones: _aficiones,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario registrado')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Nombre'),
            onSaved: (value) => _nombre = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, introduce tu nombre';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Apellidos'),
            onSaved: (value) => _apellidos = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, introduce tus apellidos';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Edad'),
            keyboardType: TextInputType.number,
            onSaved: (value) => _edad = int.tryParse(value!),
            validator: (value) {
              int? edad = int.tryParse(value!);
              if (edad == null || edad < 18) {
                return 'Debes ser mayor de edad (18+ años)';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Correo electrónico'),
            keyboardType: TextInputType.emailAddress,
            onSaved: (value) => _correo = value,
            validator: (value) {
              if (value == null || value.isEmpty || !value.contains('@')) {
                return 'Por favor, introduce un correo válido';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          const Text('Sexo'),
          RadioListTile(
            title: const Text('Masculino'),
            value: 'Masculino',
            groupValue: _sexo,
            onChanged: (value) {
              setState(() {
                _sexo = value.toString();
              });
            },
          ),
          RadioListTile(
            title: const Text('Femenino'),
            value: 'Femenino',
            groupValue: _sexo,
            onChanged: (value) {
              setState(() {
                _sexo = value.toString();
              });
            },
          ),
          const SizedBox(height: 16),
          const Text('Aficiones'),
          Column(
            children: _opcionesAficiones.map((aficion) {
              return CheckboxListTile(
                title: Text(aficion),
                value: _aficiones.contains(aficion),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      _aficiones.add(aficion);
                    } else {
                      _aficiones.remove(aficion);
                    }
                  });
                },
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {
              if (_aficiones.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Debes seleccionar al menos una afición')),
                );
                return;
              }
              _registrarUsuario();
            },
            child: const Text('Registrar'),
          ),
        ],
      ),
    );
  }
}
