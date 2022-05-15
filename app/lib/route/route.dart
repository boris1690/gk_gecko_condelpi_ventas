import 'package:flutter/material.dart';

// Define Routes
import 'package:app/screens/screens.dart' as screens;
import 'package:app/splash.dart';

// Route Names
const String loginScreen = 'login';
const String homeScreen = 'home';
const String optionScreen = 'option';
const String questionnaireScreen = 'questionnaire';
const String splashScreen = 'splash';

// Control our page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case splashScreen:
      return MaterialPageRoute(builder: (context) => Splash());
    case loginScreen:
      return MaterialPageRoute(builder: (context) => screens.Login());
    case homeScreen:
      return MaterialPageRoute(builder: (context) => screens.Home());
    case optionScreen:
      return MaterialPageRoute(builder: (context) => screens.Option());
    case questionnaireScreen:
      return MaterialPageRoute(builder: (context) => screens.Questionnaire());
    default:
      throw ('This route name does not exit');
  }
}
