import 'package:flutter_with_redux_saga/redux/modules/counter/reducer.dart';
import 'package:flutter_with_redux_saga/redux/root_state.dart';

RootState rootReducer(RootState state, dynamic action){
  return state.copyWith(
    counter: counterReducer(state.counter, action));
}
