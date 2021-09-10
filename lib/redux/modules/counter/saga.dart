import 'package:flutter_with_redux_saga/redux/modules/counter/actions.dart';
import 'package:flutter_with_redux_saga/redux/modules/counter/selectors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:redux_saga/redux_saga.dart';

counterSage() sync* {
  print("counterSage");
  yield TakeEvery(_increaseCountSage, pattern: IncreaseCount);
  yield TakeEvery(_decreaseCountSage, pattern: DecreaseCount);
  yield TakeEvery(_clearCountSage, pattern: ClearCount);
  yield TakeEvery(_assignCountSage, pattern: AssignCount);

}

_increaseCountSage({dynamic action}) sync* {
  var result = Result<int>();
  yield Select(selector: selectCount, result:result);  
  yield Call((){
    Fluttertoast.showToast(msg: "increase count to ${result.value}");
  });
}

_decreaseCountSage({dynamic action}) sync* {
  var result = Result<int>();
  yield Select(selector: selectCount, result:result);  
  yield Call((){
    Fluttertoast.showToast(msg: "decrease count to ${result.value}");
  });
}

_clearCountSage({dynamic action}) sync* {
  var result = Result<int>();
  yield Select(selector: selectCount, result:result);  
  yield Call((){
    Fluttertoast.showToast(msg: "clear count to ${result.value}");
  });
}

_assignCountSage({dynamic action}) sync* {
  var result = Result<int>();
  yield Select(selector: selectCount, result:result);  
  yield Call((){
    Fluttertoast.showToast(msg: "assign count to ${result.value}");
  });
}