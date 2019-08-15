# provider_counter

This is actually a copy from [flutter/samples/provider_counter](https://github.com/flutter/samples/blob/master/provider_counter/lib/main.dart).

First, I didn't understand why Flutter automatically updated the entire widget in the example youtube video "Flutter State Management using Provider ( A BLoC Alternative)", but then I reviewed the Flutter provider_counter example, its explanation about the listen property of the static Provider.of<T> method everything was clear. 

Provider.of is another way to access the model object held by an ancestor Provider. By default, even this listens to changes in the model, and rebuilds the whole encompassing widget when notified. By using `listen: false` below, we are disabling that behavior. We are only calling a function here, and so we don't care about the current value. Without `listen: false`, we'd be rebuilding the whole MyHomePage whenever Counter notifies listeners. 
