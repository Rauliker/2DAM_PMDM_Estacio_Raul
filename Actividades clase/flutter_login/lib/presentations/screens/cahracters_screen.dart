import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_listado/presentations/bloc/characters_bloc.dart';
import 'package:flutter_listado/presentations/bloc/characters_event.dart';
import 'package:flutter_listado/presentations/bloc/characters_state.dart';
import 'package:flutter_listado/presentations/widgets/character_lista.dart';
import 'package:flutter_listado/presentations/widgets/dialog_theme.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharactersScreen> {
  String _filter = '';

  @override
  void initState() {
    super.initState();
    context.read<CharacterBloc>().add(LoadCharactersEvent(_filter));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personajes de Harry Potter')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _filter = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Filtrar por nombre',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    context
                        .read<CharacterBloc>()
                        .add(LoadCharactersEvent(_filter));
                  },
                  child: const Icon(Icons.search),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showThemesDialog(context);
            },
            child: const Text('Temas'),
          ),
          Expanded(
            child: BlocBuilder<CharacterBloc, CharacterState>(
              builder: (context, state) {
                // Mostrar el indicador de carga mientras isLoading sea true
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                // Mostrar mensaje de error si hay uno
                else if (state.errorMessage.isNotEmpty) {
                  return Center(child: Text(state.errorMessage));
                }
                // Mostrar la lista de personajes
                else if (state.characters.isNotEmpty) {
                  return CharactersLista(char: state.characters);
                }
                // Si no hay personajes, mostrar un mensaje vacío
                else {
                  return const Center(
                      child: Text(
                          'No hay personajes que coincidan con el filtro.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
