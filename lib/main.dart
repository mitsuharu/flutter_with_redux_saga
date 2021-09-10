import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_with_redux_saga/redux/initialize_redux.dart';
import 'package:flutter_with_redux_saga/screens/counter_page.dart';

Future<void> main() async {
  
  // 必須
  WidgetsFlutterBinding.ensureInitialized();
  final store = await initializeRedux();
  
  runApp(new StoreProvider(
    store: store,
    child: MyApp(),
  ));

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue,),
        home: CounterPage(),
        );
  }
}

