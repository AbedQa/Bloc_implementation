import 'package:bloc_app/bloc/ToDoBloc.dart';
import 'package:bloc_app/repoistory/TodoRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        context: context,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final BuildContext context;

  const MyHomePage({Key key, this.context}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState(context);
}

class _MyHomePageState extends State<MyHomePage> {
  final BuildContext context;
  // ToDoBloc blocProvider;
  var isLoading = false;

  _MyHomePageState(this.context);

  @override
  void initState() {
    super.initState();
    //bloc instance
    //++
    //blocProvider = ToDoBloc(TodoRepo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Text("tamara"),
            GestureDetector(
                onTap: () => {
                      // blocProvider.dispatch(FetchToDoList()),
                      setState(() => {isLoading = true}),
                    },
                child: Icon(Icons.refresh))
          ],
          title: Text('Bloc API'),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withAlpha(50),
                    blurRadius: 5,
                    spreadRadius: 7,
                    offset: Offset(0, 1))
              ],
            ),
            height: 100,
            width: 100,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Loading',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    //blocProvider.dispose();
    super.dispose();
  }
}
