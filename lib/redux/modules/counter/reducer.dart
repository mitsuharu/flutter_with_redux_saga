import 'package:flutter_with_redux_saga/redux/modules/counter/actions.dart';
import 'package:flutter_with_redux_saga/redux/modules/counter/state.dart';

CounterState counterReducer(CounterState state, dynamic action) {
  if (action is IncreaseCount) {
    return CounterState(count: state.count + 1);
  }

  if (action is DecreaseCount) {
    return CounterState(count: state.count - 1);
  }
  
  if (action is ClearCount) {
    return CounterState(count: 0);
  }

  if (action is AssignCount){
    return CounterState(count: action.count);
  }

  return state;
}