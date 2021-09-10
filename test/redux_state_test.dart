import 'package:flutter_with_redux_saga/redux/modules/counter/actions.dart';
import 'package:flutter_with_redux_saga/redux/modules/counter/reducer.dart';
import 'package:flutter_with_redux_saga/redux/modules/counter/state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test("counter_reducer action IncreaseCount", (){
    final state = CounterState(count: 0);
    expect(state.count, 0);

    final nectState = counterReducer(state, IncreaseCount());
    expect(nectState.count, 1);
  });
  
  test("counter_reducer action DecreaseCount", (){
    final state = CounterState(count: 10);
    expect(state.count, 10);

    final nectState = counterReducer(state, DecreaseCount());
    expect(nectState.count, 9);
  });

  test("counter_reducer action ClearCount", (){
    final state = CounterState(count: 10);
    expect(state.count, 10);

    final nectState = counterReducer(state, ClearCount());
    expect(nectState.count, 0);
  });

  test("counter_reducer action AssignCount", (){
    final state = CounterState(count: 10);
    expect(state.count, 10);

    final nectState = counterReducer(state, AssignCount(count: 99));
    expect(nectState.count, 99);
  });
}