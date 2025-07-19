import 'package:bloc/bloc.dart';
import 'package:project/counter_events.dart';
import 'package:project/counter_states.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  CounterBloc() : super(CounterInitState()) {
    int counter = 1;
    on<AddCounterEvent>((event, emit) {
      counter++;
      print('user added 1');
      emit(CounterChangedState(newCounter: counter));
    });
    on<MinCounterEvent>((event, emit) {
      counter--;
      print('user removed 1');
      emit(CounterChangedState(newCounter: counter));
    });
    on<ClearCounterEvent>((event, emit) {
      counter = 0;
      print('user make it 0');
      emit(CounterChangedState(newCounter: counter));
    });
  }
}
