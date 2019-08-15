import 'dart:convert';
import 'package:b1serviceflayer/b1serviceflayer.dart';
import 'package:b1simpflemobilewarehousing/b1simpflemobilewarehousing.dart';

class QueryActivitiesAPI {
  static final _connection = B1Connection(
    serverUrl: "http://192.168.103.206:50001/b1s/v1/",
    userName: "manager",
    password: "123qwe",
    companyDB: "SBODEMOUS",
  );
  static B1ServiceLayer _b1s;
  static B1ServiceLayer get b1s {
    if(_b1s == null) _b1s = B1ServiceLayer(_connection);
    return _b1s;
  }
  Future<List<Activity>> getActivitiesTemsorWay(String query) async {
    List<Activity> activityList = [];
    await b1s.queryAsync("Activities?\$filter=contains(Details,'$query')")
      .then(json.decode)
      .then((/*Map<String,dynamic>*/jsonMap) => jsonMap["value"] as List<dynamic>)
      .then((/*List<Map<String,dynamic>>*/listOfMaps) => 
        listOfMaps.forEach((activity) => activityList.add(Activity.fromMap(activity as Map<String,dynamic>))));
      return activityList;
  }
  // Future<List<Activity>> getActivitiesMikiWay(String query) async {
  //   return List<Activity>.from(((json.decode(await B1ServiceLayer(_connection).queryAsync("Activities")) 
  //     as Map<String,dynamic>)["value"] 
  //     as List<dynamic>).map((activity) => Activity.fromMap(activity as Map<String,dynamic>))
  //   ); 
  // }
}