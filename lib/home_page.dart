import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/counter_bloc.dart';
import 'package:project/counter_events.dart';
import 'package:project/counter_states.dart';
import 'package:project/notifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterStates>(
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
            leading: Builder(
              builder: (context) {
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
    );
  }
}
