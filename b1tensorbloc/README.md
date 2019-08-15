# b1tensorbloc

A Flutter project to experiment with the BloC pattern as explained by Tensor Programming (TP) in 
[Using the BloC Pattern to Build Reactive Applications with Streams in Dart's Flutter Framework](https://www.youtube.com/watch?v=ALcbTxz3bUw)
My version here, however, uses querying SAP B1 activities via Service Layer instead of the video list.

The application worked great, after the initial 5 - 8 seconds of login and first call, Service Layer behaved quite snappily, to my surprise, so no need to worry about mobile app performance.

TP, just like Zaiste, uses rxdart for his blocs, which makes the anyway not simple stream-based bloc architecture even more complicated. I am pretty sure it's doable and learnable, but the provider package directly from the Flutter team is a hell lot simpler.
  
