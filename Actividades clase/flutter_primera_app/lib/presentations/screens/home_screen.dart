import 'package:flutter/material.dart';
import 'package:plutter_primera_app/presentations/screens/widgets/mi_texto_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _MyAppState();
}

class _MyAppState extends State<HomeScreen> {
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Aplicación Material',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Título de la barra'),
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MiTexto(textoAMostrar: 'El valor de la cuenta es:'),
                Text("$contador",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            )),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      contador++;
                    });
                    debugPrint("[LOG]: Actualizando contador a $contador");
                  },
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      contador--;
                    });
                    debugPrint("[LOG]: Actualizando contador a $contador");
                  },
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      contador = 0;
                    });
                    debugPrint("[LOG]: Actualizando contador a $contador");
                  },
                  child: const Icon(Icons.restart_alt),
                ),
              ],
            )));
  }
}
