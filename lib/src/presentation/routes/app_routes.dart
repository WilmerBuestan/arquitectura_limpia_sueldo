import 'package:flutter/material.dart';
import '../views/home_page.dart';
import '../views/result_page.dart';
import '../views/history_page.dart'; // <--- Importar
import '../../domain/entities/result_operator.dart';

class AppRoutes {
  static const home = '/';
  static const String resultOperatorRoute = '/resultado';
  static const String historyRoute = '/historial'; // <--- Nueva constante

  static Map<String, WidgetBuilder> routes = {
    home: (_) => const HomePage(), // (Asegúrate que HomePage sea const si puedes)
    historyRoute: (_) => const HistoryPage(), // <--- Nueva ruta

    resultOperatorRoute: (context) {
      final args = ModalRoute.of(context)!.settings.arguments as ResultOperator;
      return ResultPage(result: args);
    },
  };
}