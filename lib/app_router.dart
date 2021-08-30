import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sameha/constants/strings.dart';
import 'package:sameha/presentation/screens/entering_the_patient.dart';
import 'package:sameha/presentation/screens/home_screen.dart';
import 'package:sameha/presentation/screens/patient_interface.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case enteringThePateint:
        return MaterialPageRoute(builder: (_) => EnteringThePateint());
      case patientInterface:
        return MaterialPageRoute(builder: (_) => PatientInterface());
    }
  }
}
