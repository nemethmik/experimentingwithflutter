import 'package:b1simpflemobilewarehousing/b1simpflemobilewarehousing.dart';
import 'package:b1tensorbloc/bloc.dart';
import 'package:flutter/material.dart';
import "model.dart";
import "provider.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ActivitiesProvider(
        bloc: ActivitiesBloc(QueryActivitiesAPI()),
        child: MaterialApp(
          title: 'BloC Query Activities',
          theme: ThemeData(primarySwatch: Colors.blue,),
          home: MyHomePage(title: 'BloC Query Activities'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // int _counter = 0;
  // void _incrementCounter() async {
  //   // int numberOfActivities = (await API().getActivitiesMikiWay("")).length;
  //   int numberOfActivities = (await QueryActivitiesAPI().getActivitiesTemsorWay("more")).length;
  //   setState(() {
  //     // _counter++;
  //     _counter = numberOfActivities;
  //   });
  // }
  final String title;
  MyHomePage({this.title});
  @override
  Widget build(BuildContext context) {
    final activitiesBloc = ActivitiesProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
          children: <Widget>[
            Container(padding: EdgeInsets.all(10),
              child: TextField(
                onChanged: activitiesBloc.query.add,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Details search for Activities",
                ),
              ),
            ),
            StreamBuilder(stream: activitiesBloc.log,
              builder: (context,snapshot) => Container(
                child: Text(snapshot?.data ?? ""),
              ),
            ),
            Flexible(
              child: StreamBuilder<List<Activity>>(
                stream: activitiesBloc.activityList,
                builder: (context,snapshot){
                  if(!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator(),);
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context,index) => ListTile(
                        leading:CircleAvatar(child: Text(snapshot.data[index].activity.value.substring(3,5)),),
                        title: Text(snapshot.data[index].details),
                        subtitle: Text(snapshot.data[index].notes),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      );
  }
}
