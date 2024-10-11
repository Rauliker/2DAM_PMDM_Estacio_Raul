import 'package:flutter/material.dart';

class FormRobot extends StatefulWidget {
  const FormRobot({super.key});

  @override
  State<FormRobot> createState() => _FormRobotState();
}

class _FormRobotState extends State<FormRobot> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreRobotController = TextEditingController();
  String nombreRobot = "Pepe";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(label: Text("Nombre:")),
                controller: _nombreRobotController,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return "Debe introducir un nombre para generar el robot";
                //   } else {
                //     return null;
                //   }
                // },
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: () {
                      bool funciona = false;
                      String textoSnack = "";
                      if (_formKey.currentState!.validate() &&
                          _nombreRobotController.text.isNotEmpty) {
                        setState(() {
                          nombreRobot = _nombreRobotController.text;
                        });
                        textoSnack = 'Robot con nombre $nombreRobot creado ';
                        funciona = true;
                      } else {
                        textoSnack = 'Pon un nombre';
                        funciona = false;
                      }
                      _mostrarDialogo(context, funciona, textoSnack);
                    },
                    child: const Text("Generar robot")),
              ),
              Center(child: getRobotImage(nombreRobot))
            ]),
      ),
    );
  }

  Image getRobotImage(String? nombre) {
    if (nombre == null || nombre.isEmpty) {
      return Image.network(
          "https://upload.wikimedia.org/wikipedia/en/0/02/Homer_Simpson_2006.png");
    }
    return Image.network("https://robohash.org/$nombreRobot");
  }

  void _mostrarDialogo(BuildContext context, bool func, String text) {
    String title = "";
    if (func == true) {
      title = "Robot creado";
    } else {
      title = "Error";
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
