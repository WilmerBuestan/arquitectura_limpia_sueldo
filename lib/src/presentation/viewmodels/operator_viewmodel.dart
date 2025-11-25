import 'package:flutter/material.dart';
import '../../domain/entities/operator.dart';
import '../../domain/entities/result_operator.dart';
import '../../domain/usescases/calculate_increase_usescases.dart';

class OperatorViewModel extends ChangeNotifier {
  final CalculateIncreaseUseCase _useCase;

  OperatorViewModel(this._useCase);

  ResultOperator? result;

  // 1. Creamos la lista para el historial (Base de datos en memoria)
  List<ResultOperator> _history = [];

  // 2. Getter para que las vistas puedan leer la lista
  List<ResultOperator> get history => _history;

  ResultOperator calculate(double salary, double antique) {
    final operator = Operator(salary: salary, antique: antique);
    result = _useCase.execute(operator);

    // 3. ¡Aquí está la clave! Guardamos el resultado en la lista
    if (result != null) {
      _history.add(result!);
    }

    notifyListeners();
    return result!;
  }
}