import 'package:flutter/material.dart';
import 'package:flutter_contador/presentation/bloc/counter/counter_events.dart';
import 'package:flutter_contador/presentation/bloc/counter/counter_state.dart';
import 'package:flutter_contador/presentation/widgets/counter_buttons_widget.dart';
import 'package:flutter_contador/presentation/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contador/presentation/widgets/counter_drawer.dart';

class CounterHomePageScreen extends StatelessWidget {
  const CounterHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text('Bloc Counter ${state.transactionCount}');
            },
          ),
          actions: [
            TextButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterReset());
                },
                child: const Icon(Icons.refresh))
          ],
        ),
        body: Center(
          child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) => Text("Cuenta: ${state.counter}")),
        ),
        floatingActionButton: const CounterButtonsWidget(),
        drawer: const ConterDrawer());
  }
}
