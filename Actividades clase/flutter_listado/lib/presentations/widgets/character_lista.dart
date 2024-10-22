import 'package:flutter/material.dart';
import 'package:flutter_listado/domain/entities/character.dart';
import 'package:flutter_listado/presentations/widgets/modal.dart';

class CharactersLista extends StatelessWidget {
  final List<Character> char;

  const CharactersLista({super.key, required this.char});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Personajes mostrados: ${char.length}"),
        Expanded(
          child: ListView.builder(
            itemCount: char.length,
            itemBuilder: (context, index) {
              final character = char[index];
              return ListTile(
                leading: Image.network(character.image),
                title: Text(character.name),
                subtitle: Text(
                    "${character.house}\n${character.age}\n${character.species}"),
                onTap: () {
                  tapCharacter(context, character.name, character.house,
                      character.age, character.species);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
