import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/counter_bloc.dart';
import 'package:project/counter_events.dart';
import 'package:project/counter_states.dart';
import 'package:project/notifications.dart';
import 'package:project/varicables.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: globalCounterbloc,
      child: BlocBuilder<CounterBloc, CounterStates>(
        builder: (context, state) {
          return Scaffold(
            drawer: Drawer(
              backgroundColor: Colors.grey.shade400,
              child: Notifications(),
            ),
            appBar: AppBar(
              backgroundColor: Colors.orange,
              title: Text(
                'George',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,

              leading: BlocBuilder<CounterBloc, CounterStates>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Badge(
                      label: Text(
                        state is CounterChangedState
                            ? state.newCounter.toString()
                            : '1',
                        style: TextStyle(fontSize: 16),
                      ),
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(
                        context,
                      ).add(AddCounterEvent());
                    },
                    icon: Icon(Icons.add, size: 50),
                  ),
                  Text(
                    state is CounterChangedState
                        ? state.newCounter.toString()
                        : '1',
                    style: TextStyle(fontSize: 60),
                  ),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(
                        context,
                      ).add(MinCounterEvent());
                    },
                    icon: Icon(Icons.remove),
                    iconSize: 50,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
