# provider_arc

This project was originally a copy from [FilledStacks](https://github.com/FilledStacks/flutter-tutorials/tree/master/014-provider-v3-updates/2-final) as part of his youtube video 
[Flutter Provider V3 Architecture ProxyProvider for Dependency Injection](https://www.youtube.com/watch?v=VgrK_LlQRJ4)

The [provider package](https://pub.dev/packages/provider) is the only officially documented state-management approach [data-and-backend/state-mgmt/simple](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple) on Flutter Dev.
Provider is maintained by the Flutter team, while no BloC implementation is available from Google. Provider is a bit simpler, but BloC has a big advantage, it is based on a generic infrastructure: streams. Most BloC users however use rxdart, too.
The guy behind FilledStacks, however, prefers provider vs bloc.

After copying I started adjusting it to my taste.
