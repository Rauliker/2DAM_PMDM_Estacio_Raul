import 'package:flutter/material.dart';

class FormControllerExample extends StatefulWidget {
  const FormControllerExample({super.key});

  @override
  State<FormControllerExample> createState() => _MyFormState();
}

class _MyFormState extends State<FormControllerExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Añadimos un listener al controller para que esté atento a posibles cambios
    _nameController.addListener(_ultimoValorIntroducido);
  }

  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              child: Container(
                  alignment: Alignment.centerRight,
                  child: CheckboxListTile(
                    title: const Text('¿Es un adulto?'),
                    checkColor: Colors.white,
                    value: isChecked,
                    activeColor: Colors.red,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'opcion1', child: Text('Opción 1')),
                DropdownMenuItem(value: 'opcion2', child: Text('Opción 2')),
              ],
              onChanged: (value) {},
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint('El nombre introducido es: ${_nameController.text}');
              },
              child: const Text('Mostrar Nombre'),
            ),
          ],
        ),
      ),
    );
  }

  void _ultimoValorIntroducido() {
    final text = _nameController.text;
    debugPrint(
        'Tamaño del texto introducido: $text (${text.characters.length})');
  }

  @override
  void dispose() {
    // Eliminar el controlador cuando el widget desaparece
    _nameController.dispose();
    super.dispose();
  }
}
