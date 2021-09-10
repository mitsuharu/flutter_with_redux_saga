import 'package:flutter_with_redux_saga/redux/root_reducer.dart';
import 'package:flutter_with_redux_saga/redux/root_saga.dart';
import 'package:flutter_with_redux_saga/redux/root_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:redux_saga/redux_saga.dart';
import 'package:redux_logging/redux_logging.dart';

/// initialize redux
Future<Store<RootState>> initializeRedux() async {

  // create Persistor
  final persistor = Persistor<RootState>(
    storage: FlutterStorage(),
    serializer: JsonSerializer<RootState>(RootState.fromJson),
  );

  // // load initial state
  final initialState = await _loadState(persistor);

  // create the saga middleware
  final sagaMiddleware = createSagaMiddleware();

  // Create store and apply middleware
  final store = Store<RootState>(
    rootReducer,
    initialState: initialState,
    middleware: [
      applyMiddleware(sagaMiddleware), 
      persistor.createMiddleware(),
      new LoggingMiddleware.printer(),
    ]);
    
    //connect to store
    sagaMiddleware.setStore(store);

    // then run the saga
    sagaMiddleware.run(rootSaga);
    
    return store;
}

Future<RootState> _loadState(Persistor<RootState> persistor) async {
  try {
    final initialState = await persistor.load();
    return initialState ?? RootState.initialState();
  } on Exception {
    return RootState.initialState();
  }
}