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
const String quoteStep1Screen = 'quoteStep1';
const String quoteStep2Screen = 'quoteStep2';

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
    case quoteStep1Screen:
      return MaterialPageRoute(builder: (context) => screens.Step1());
    case quoteStep2Screen:
      return MaterialPageRoute(builder: (context) => screens.Step2());
    default:
      throw ('This route name does not exit');
  }
}
