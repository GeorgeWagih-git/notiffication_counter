abstract class CounterStates {}

class CounterInitState extends CounterStates {}

class CounterChangedState extends CounterStates {
  int newCounter;
  CounterChangedState({required this.newCounter});
}

class CounterSmallerThanZero extends CounterStates {}
