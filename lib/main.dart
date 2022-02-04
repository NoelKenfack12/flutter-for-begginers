import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FuturePage(),   
    );
  }}
class FuturePage extends StatefulWidget {
  @override
  _FuturePageState createState() => _FuturePageState();
}
class _FuturePageState extends State<FuturePage> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back from the Future'),
      ),
      body: Center(
        child: Column(children: [
          Spacer(),
          ElevatedButton(
            child: Text('GO1'),
            onPressed: () {
              result = '';
              setState(() {
                result = result;
              });
              getData()
                  .then((value) {
                result = value.body.toString().substring(0, 500);
                setState(() {
                  result = result;
                });
              }).catchError((_){
                result = 'An error occurred';
                setState(() {
                  result = result;
                });
              });
            },
          ),
          Spacer(),
          Text(result.toString()),
          Spacer(),
          CircularProgressIndicator(),
          Spacer(),
        ]),
      ),
    );
  }

  Future<Response> getData() async { 
    final String authority = 'www.googleapis.com';
    final String path = 'books/v1/volumes/AAbCwAEACAAJ';
    Uri url = Uri.https(authority, path); 
    return http.get(url);
  } 
}