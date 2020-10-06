import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mybloc/state.dart';

part 'my_counter_event.dart';
part 'my_counter_state.dart';

class MyCounterBloc extends Bloc<MyCounterEvent, StateApp> {
  MyCounterBloc(we) : super(we);

  StateApp get initialState {
    return StateApp.initial();
  }

  onadd() {
    print(initialState.counter);

    add(AddEvent());
  }

  ondeleted() {
    print(initialState.counter);
    add(DeleteEvent());
  }

  @override
  Stream<StateApp> mapEventToState(
    MyCounterEvent event,
  ) async* {
    if (event is AddEvent) {
      yield this.initialState..counter -= 100;
    } else if (event is DeleteEvent) {
      yield this.initialState..counter -= 100;
    }
  }
}
