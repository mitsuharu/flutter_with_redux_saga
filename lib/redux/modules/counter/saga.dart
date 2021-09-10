import 'package:flutter_with_redux_saga/redux/modules/counter/actions.dart';
import 'package:flutter_with_redux_saga/redux/modules/counter/selectors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:redux_saga/redux_saga.dart';

counterSaga() sync* {
  yield TakeEvery(_increaseCountSaga, pattern: IncreaseCount);
  yield TakeEvery(_decreaseCountSaga, pattern: DecreaseCount);
  yield TakeEvery(_clearCountSaga, pattern: ClearCount);
  yield TakeEvery(_assignCountSaga, pattern: AssignCount);

}

_increaseCountSaga({dynamic action}) sync* {
  var result = Result<int>();
  yield Select(selector: selectCount, result:result);  
  yield Call((){
    Fluttertoast.showToast(msg: "increase count to ${result.value}");
  });
}

_decreaseCountSaga({dynamic action}) sync* {
  var result = Result<int>();
  yield Select(selector: selectCount, result:result);  
  yield Call((){
    Fluttertoast.showToast(msg: "decrease count to ${result.value}");
  });
}

_clearCountSaga({dynamic action}) sync* {
  var result = Result<int>();
  yield Select(selector: selectCount, result:result);  
  yield Call((){
    Fluttertoast.showToast(msg: "clear count to ${result.value}");
  });
}

_assignCountSaga({dynamic action}) sync* {
  var result = Result<int>();
  yield Select(selector: selectCount, result:result);  
  yield Call((){
    Fluttertoast.showToast(msg: "assign count to ${result.value}");
  });
}