import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_with_redux_saga/redux/modules/counter/actions.dart';
import 'package:flutter_with_redux_saga/redux/root_state.dart';

class CounterPage extends StatelessWidget{
  CounterPage();

  Widget counterWidget(){
    return StoreConnector<RootState, int>(
      distinct: true,
      converter: (store) => store.state.counter.count,
      builder: (context, count){
        return Center(child: Text("count:" + count.toString()));
      },
    );
  }

  Widget increaseButtonWidget(){
    return StoreConnector<RootState, VoidCallback>(
      distinct: true,
      converter: (store) => () => store.dispatch(IncreaseCount()),
      builder: (context, onPressed){
        return TextButton(
          onPressed: onPressed,
          child: Text("increase"),
        );
      },
    );
  }

  Widget decreaseButtonWidget(){
    return StoreConnector<RootState, VoidCallback>(
      distinct: true,
      converter: (store) => () => store.dispatch(DecreaseCount()),
      builder: (context, onPressed){
        return TextButton(
          onPressed: onPressed,
          child: Text("decrease"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("counter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          counterWidget(),
          increaseButtonWidget(),
          decreaseButtonWidget(),
        ],),
    );
  }
  
}