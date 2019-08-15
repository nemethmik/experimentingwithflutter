import 'bloc.dart';
import 'model.dart';
import 'package:flutter/widgets.dart';

class ActivitiesProvider extends InheritedWidget {
  final ActivitiesBloc activitiesBloc;
  @override bool updateShouldNotify(InheritedWidget oldWidget) => true;
  static ActivitiesBloc of(BuildContext context) =>
    (context.inheritFromWidgetOfExactType(ActivitiesProvider) as ActivitiesProvider).activitiesBloc;
  ActivitiesProvider({Key key,ActivitiesBloc bloc, Widget child}) 
    : this.activitiesBloc = bloc ?? ActivitiesBloc(QueryActivitiesAPI()),
    super(child:child,key:key); 
}