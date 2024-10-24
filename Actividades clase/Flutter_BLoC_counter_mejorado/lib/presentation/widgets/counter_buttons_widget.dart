import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contador/presentation/bloc/counter/counter_bloc.dart';
import 'package:flutter_contador/presentation/bloc/counter/counter_events.dart';

class CounterButtonsWidget extends StatelessWidget {
  const CounterButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(const CounterIncreased(1));
          },
          child: const Text("+")),
      const SizedBox(
        height: 15,
      ),
      FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(const CounterIncreased(-1));
          },
          child: const Text("-"))
    ]);
  }
}
