# Experimenting with Flutter
A project for learning Flutter.
I'll put this project on hold now and I am coming back to React/TypeScript/MUI to experiment with a local project React Client for Service Broker.
I commited this statement on January 19, and a couple of days ago I reopened the project to go on with experimenting with Flutter. I am maintaining an accompanying document file on my private onedrive: FlutterGettingStarted.
This repository has a number of branches. Each sample is saved in a separate branch.
The master branch is practically empty, it has only a README.md, a basic .gitignore and a LICENSE file. This is perfectly fine for Visual Studio Code, Android Studio maintains a bunch of workspace and project files.
So, to create a new project, first create a new branch then use the usual 
`flutter create .` where the dot is the current directory, as documented on the [Flutter Test Drive page](https://flutter.dev/docs/get-started/test-drive?tab=terminal)
With this commit I upgraded the default gitignore with the [gitignore available on the GitHub page of Flutter](https://raw.githubusercontent.com/flutter/flutter/master/.gitignore), so you don't be worried, hopefully, about gitignore. 
Fortunately, the command line command flutter create accepts this enhanced gitignore file.
So, remember to create a new branch from master before running flutter create.

The first branch was `hitesh01`, check out that branch.
Now I am creating a `helloworld` branch for the most basic app explained on [flutter.dev/docs/development/ui Introduction to widgets](https://flutter.dev/docs/development/ui/widgets-intro)

## [Flutter Architecture Samples](https://github.com/brianegan/flutter_architecture_samples)
The most important Flutter saple set is Brian Egan's sample set especially the [Vanilla](https://github.com/brianegan/flutter_architecture_samples/tree/master/example/vanilla) is brilliant. 
In this example he mentiones that he brough the concepts from React's [Lifting State Up](https://reactjs.org/docs/lifting-state-up.html) as well as Thinking in React, which my favorite, too.

## Real or False Issues with Flutter?
A couple of young developer guys after three days of evaluating Flutter, collected their major concers and dropped the language and tool completely.
- No private and protected visibility, only public and package.
- No interface keyword
- No runtime reflection to get annotation info
- Very little help on stackoverflow
- Asynchronous programming is nightmare
- No traditional lifecycle management for UI
- Packages are under heavy development, no stable API  

I wouldn't say all of these are nonsense, some has some truth in it. Honestly, I can only agree with the comment about runtime reflection. Dart has neither finalizers, nor destructors either, which is really pain.
Android Java VM's and iOS/Swift's real preemptive multithreading both are superior. On the other hand hundreds of thousands of programmers are working with asynchronous JavaScript/TypeScript; Dart has exactly the same event loop-based Future/Promise machinery for asynchronous programming. Since the underlying packages for HTTP communications, behind the scene use real multi-threading, in practice JS, TS, Dart all are excellent for regular async programming. Definitely, neither in JS/TS nor in Dart you cannot implement complex, lengthy computations, but libraries like Axios/JavaScript and http/Dart work excellently for asynchronous communication.
Flutter is one of the best documented new language with hundreds of excellent training videos, tutorials on Youtube (Tensor Programming, for example), Udemy, Medium, Flutter.dev.   