import 'package:provider/provider.dart';
import 'package:provider_arc/posts_model.dart';
import 'authentication_service.dart';

import 'user.dart';
import 'api.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: Api())
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<Api, AuthenticationService>(
    builder: (context, api, authenticationService) =>
        AuthenticationService(api: api),
  ),
  // ProxyProvider<Api, PostsModel>(
  //   builder: (context, api, authenticationService) =>
  //       PostsModel(api: api),
  // ),
  ChangeNotifierProxyProvider<Api, PostsModel>(
    builder: (context, api, authenticationService) =>
        PostsModel(api: api),
  )
];

List<SingleChildCloneableWidget> uiConsumableProviders = [
  StreamProvider<User>(
    builder: (context) => Provider.of<AuthenticationService>(context, listen: false).user,
  )
];
