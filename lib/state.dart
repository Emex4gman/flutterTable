class StateApp {
  int counter;
  StateApp._();
  factory StateApp.initial() {
    return StateApp._()..counter = 0;
  }
}
