import 'package:flutter_with_redux_saga/redux/modules/counter/saga.dart';
import 'package:redux_saga/redux_saga.dart';

rootSaga() sync* {
  yield Fork(counterSaga);
}