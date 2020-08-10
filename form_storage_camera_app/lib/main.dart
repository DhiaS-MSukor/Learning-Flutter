import 'package:flutter/material.dart';
import 'form/form.dart';
import 'form/saved_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form, Storage & Cam',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/Form': (context) => FormWidget(),
        '/SavedForm': (context) => SavedFormWidget()
      },
      home: MyHomePage(title: 'Form, Storage & Camera'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Form');
                },
                child: Text('Form'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/savedForm');
                },
                child: Text('Saved Form'),
              ),
            ],
          ),
        ));
  }
}
