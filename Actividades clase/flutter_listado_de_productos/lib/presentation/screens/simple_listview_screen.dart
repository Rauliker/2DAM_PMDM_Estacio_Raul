import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SimpleListView extends StatelessWidget {
  const SimpleListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple ListView'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            buildCard(context, "Elemento 1"),
            const SizedBox(height: 10),
            buildCard(context, "Elemento 2"),
            const SizedBox(height: 10),
            buildCard(context, "Elemento 3"),
            const SizedBox(height: 10),
            buildCard(context, "Elemento 4"),
          ],
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String title) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              "assets/images/guerrero-espartano.png",
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 10),
          Text(title),
          ElevatedButton(
            onPressed: () {
              // Navega a la página de detalle, pasando información del producto
              context.go('/detail', extra: {
                "title": title,
                "description": "Descripción del $title",
                "price": 99.99
              });
            },
            child: const Text('Ver detalles'),
          ),
        ],
      ),
    );
  }
}
