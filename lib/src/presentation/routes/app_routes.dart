import 'package:flutter/material.dart';
import '../views/home_page.dart';
import '../views/result_page.dart';
import '../../domain/entities/result_operator.dart';

class AppRoutes {
  static const home = '/';
  static const String resultOperatorRoute = '/resultado';

  static Map<String, WidgetBuilder> routes = {
    home: (_) => HomePage(),

    resultOperatorRoute: (context) {
      final args = ModalRoute.of(context)!.settings.arguments as ResultOperator;

      // CORRECCIÓN: Cambiamos 'resultado' por 'result'
      return ResultPage(result: args);
    },
  };
}