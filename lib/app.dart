import "package:flutter/material.dart";
class App extends StatefulWidget{createState() => AppStateKeeper();}
//class App extends StatelessWidget {
class AppStateKeeper extends State<StatefulWidget> {
  final barColor = const Color(0xFF26ae60);
  final bgColor = const Color(0xFFDAE0E2);
  int myValue = 1;
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Text("Clicked $myValue times"),
        floatingActionButton: FloatingActionButton(
          backgroundColor: barColor,
          onPressed: (){this.setState((){myValue += 1;});},
          child: Icon(Icons.add),        
        ),
        backgroundColor: bgColor,
        appBar: AppBar(
          title: Text("Instagram"),
          backgroundColor: barColor,
        ),
      ),
    );
  }
}