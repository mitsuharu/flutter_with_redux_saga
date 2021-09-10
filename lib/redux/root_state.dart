import 'dart:convert';
import 'package:flutter_with_redux_saga/redux/modules/counter/state.dart';
import 'package:meta/meta.dart';

@immutable
class RootState{

  final CounterState counter;
  RootState({required this.counter});

  RootState copyWith({CounterState? counter}) {
    return RootState(counter: counter ?? this.counter);
  }

  static initialState(){
    return RootState(counter: CounterState.initialState());
  }

   static RootState fromJson(dynamic json) {
     try{
       return RootState(counter: CounterState.fromJson(jsonDecode(json["counter"])));
     } on Exception{
       return RootState.initialState();
     }
  }

  dynamic toJson() { 
    return {"counter": jsonEncode(counter)};
  }
}
