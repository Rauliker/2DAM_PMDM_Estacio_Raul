import 'package:flutter/material.dart';
import 'package:flutter_contador/presentation/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contador/presentation/bloc/counter/counter_state.dart';

class ConterDrawer extends StatelessWidget {
  const ConterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListTile(
          title: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text('Bloc Counter ${state.transactionCount}');
            },
          ),
        ),
      ),
    );
  }
}
