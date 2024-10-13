import 'package:flutter/material.dart';
import '../../infraestructure/models/usuario.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showRegisterDialog(context);
          },
          child: const Text('Abrir formulario de registro'),
        ),
      ),
    );
  }
}

// Cambiado a void y se elimina async
void showRegisterDialog(BuildContext context) {
  showDialog<Usuario>(
    context: context,
    builder: (context) => const RegisterFormDialog(),
  ).then((usuario) {
    if (usuario != null) {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Usuario Registrado'),
          content: Text('Nombre: ${usuario.nombre}\n'
              'Apellidos: ${usuario.apellidos}\n'
              'Edad: ${usuario.edad}\n'
              'Correo: ${usuario.correo}\n'
              'Sexo: ${usuario.sexo}\n'
              'Aficiones: ${usuario.aficiones.join(", ")}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Registro Cancelado'),
          content: Text('El registro ha sido cancelado.'),
          actions: [
            TextButton(
              onPressed: null,
              child: Text('Cerrar'),
            ),
          ],
        ),
      );
    }
  });
}

class RegisterFormDialog extends StatefulWidget {
  const RegisterFormDialog({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterFormDialogState createState() => _RegisterFormDialogState();
}

class _RegisterFormDialogState extends State<RegisterFormDialog> {
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

  void _registrarUsuario(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Usuario usuario = Usuario(
        nombre: _nombre!,
        apellidos: _apellidos!,
        edad: _edad!,
        correo: _correo!,
        sexo: _sexo!,
        aficiones: _aficiones,
      );
      Navigator.of(context).pop(usuario); // Retorna el objeto Usuario
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Formulario de Registro'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: ListBody(
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
                decoration:
                    const InputDecoration(labelText: 'Correo electrónico'),
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
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () =>
              Navigator.of(context).pop(null), // Retorna null al cancelar
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_aficiones.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Debes completar el formulario')),
              );
              return;
            }
            _registrarUsuario(context);
          },
          child: const Text('Aceptar'),
        ),
      ],
    );
  }
}
