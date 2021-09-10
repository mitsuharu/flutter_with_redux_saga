import 'package:flutter_with_redux_saga/redux/root_state.dart';

int selectCount(RootState state) {
  return state.counter.count;
}