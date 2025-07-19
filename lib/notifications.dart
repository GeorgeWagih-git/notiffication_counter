import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project/counter_bloc.dart';
import 'package:project/counter_events.dart';
import 'package:project/counter_states.dart';

class Notifications extends StatefulWidget {
  Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterStates>(
      builder: (context, state) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(
                        context,
                      ).add(ClearCounterEvent());
                    },
                    child: Text(
                      'Clear All',
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                BlocProvider.of<CounterBloc>(
                                  context,
                                ).add(MinCounterEvent());
                              },
                              backgroundColor: Colors.red,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.notification_add, color: Colors.pink),
                              Text(
                                'You have 1 new notfcaion',
                                style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: state is CounterChangedState
                      ? state.newCounter
                      : 0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
