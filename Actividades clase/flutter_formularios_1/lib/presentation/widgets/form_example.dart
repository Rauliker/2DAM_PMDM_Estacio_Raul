import 'package:flutter/material.dart';

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _userName = '';
  bool _imageLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Nombre:',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 600,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      border: OutlineInputBorder(),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Debe introducir un nombre para generar el robot';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      if (value != null) {
                        setState(() {
                          _userName = value;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    setState(() => _imageLoaded = true);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Robot actualizado con el nombre $_userName')),
                    );
                  }
                },
                child: const Text('Generar Robot'),
              ),
            ]),
            _imageLoaded
                ? Image.network('https://robohash.org/$_userName')
                : Container(),
          ],
        ),
      ),
    );
  }
}
