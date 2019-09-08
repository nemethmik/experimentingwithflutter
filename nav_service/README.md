# nav_service

FilledStacks' [experimental solution](https://github.com/FilledStacks/flutter-tutorials/tree/master/025-navigation-service) to use navigation in his view model (change notifier). As he explained in his [video](https://www.youtube.com/watch?v=kopdISefbJc)

I'll add a feature to prevent back-navigation from the home screen without logging out.

I have extended home_view and home_viewmodel:
- I have wrapped the scaffold in a WillPopScope widget, which called onWillPop the view model object's onWillPop function returning Future<bool>.
- I have added an onWillPop async Future<bool> function to the home view model, which returned false with an error message.
The architecture of this application wasn't designed for this situation, so that's all what I could do. Actually after the error message the user could press the logout button.
 


