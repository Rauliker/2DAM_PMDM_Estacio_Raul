import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contador/presentation/bloc/counter/counter_bloc.dart';
import 'package:flutter_contador/presentation/bloc/counter/counter_events.dart';
import 'package:flutter_contador/presentation/bloc/counter/counter_state.dart';
import 'package:flutter_contador/presentation/widgets/dialog_theme.dart';

class CounterDrawerWidget extends StatelessWidget {
  const CounterDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text("Cuenta: ${state.counter}");
              },
            ),
            trailing: TextButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterReset());
              },
              child: const Icon(Icons.refresh),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showThemesDialog(context);
            },
            child: const Text('Temas'),
          ),
        ],
      ),
    );
  }
}
