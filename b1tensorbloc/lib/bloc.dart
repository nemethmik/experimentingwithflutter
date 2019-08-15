
import 'package:b1simpflemobilewarehousing/b1simpflemobilewarehousing.dart';

import 'model.dart';
import 'package:rxdart/rxdart.dart';

class ActivitiesBloc {
  final QueryActivitiesAPI api;
  Stream<List<Activity>> _activityListFromQuery = Stream.empty();
  Stream<String> _log = Stream.empty();
  //ReplaySubject is from RxDart, but it can be replaced with a Stream Controller
  ReplaySubject<String> _query = ReplaySubject<String>(); //This stream is coming from UI and should be closed at the end

  Stream<List<Activity>> get activityList => _activityListFromQuery;
  Stream<String> get log => _log;
  Sink<String> get query => _query;

  ActivitiesBloc(this.api) {
    _activityListFromQuery = _query.distinct().asyncMap(api.getActivitiesTemsorWay).asBroadcastStream();
    _log = Observable(activityList)
      .withLatestFrom(_query.stream, (_,q) => "Results for $q")
      .asBroadcastStream();
  }
  void dispose() {
    _query.close();
    //The other two streams are originated from the BloC and no need to close them
  }
}
