import 'package:bloc/bloc.dart';
import 'package:project/counter_events.dart';
import 'package:project/counter_states.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  CounterBloc() : super(CounterInitState()) {
    int counter = 0;
    on<AddCounterEvent>((event, emit) {
      counter++;
      emit(CounterChangedState(newCounter: counter));
    });
    on<MinCounterEvent>((event, emit) {
      if (counter == 0) {
        emit(CounterSmallerThanZero());
        return;
      }
      counter--;
      emit(CounterChangedState(newCounter: counter));
    });
    on<ClearCounterEvent>((event, emit) {
      counter = 0;
      emit(CounterChangedState(newCounter: counter));
    });
  }
}
