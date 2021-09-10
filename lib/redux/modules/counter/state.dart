import 'package:meta/meta.dart';

@immutable
class CounterState{
  final int count;
  CounterState({required this.count});

  CounterState copyWith({
    int? count
  }) {
    return CounterState(
      count: count ?? this.count,
    );
  }

  static initialState(){
    return CounterState(count: 0);
  }

  static CounterState fromJson(dynamic json) {
    try{
      return CounterState(count: json["count"] as int);
    }catch(e){
      return CounterState.initialState();
    }
  }

  dynamic toJson() {
    return {"count": count};
  }
}