import 'package:flutter/material.dart';

void main() => runApp(OccurenceApp());


class OccurenceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OccuranceLetterApp',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('OccurenceLetterApp'),
          ),
          body: MyHomePage()
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  var test = '';
  List<String> array = [];
  var numberOfWords = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 150, bottom: 0),
            child: Text('Introduce some text below', style:TextStyle(color: Colors.black),),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insert some text';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    test = value;
                  });
                },
                decoration: InputDecoration(hintText: 'Input string'),
              )),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ElevatedButton(
              onPressed: () {
                if(_formKey.currentState!.validate()) {
                  setState(() {
                    numberOfWords = 0;
                    array = test.trim().split(' ');
                  });
                  array.forEach((element) {
                    if(element.contains('a')) {
                      numberOfWords++;
                    }
                  });
                }
              },
              child: Text('Calculate'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Text('Number of words that contain letter a : $numberOfWords', style:TextStyle(color: Colors.black),),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: ElevatedButton(
              onPressed: () {
                _formKey.currentState?.reset();
                setState(() {
                  test = '';
                  array = [];
                  numberOfWords = 0;
                });
              },
              child: Text('Reset'),
            ),
          )
        ],
      ),
    );
  }
}