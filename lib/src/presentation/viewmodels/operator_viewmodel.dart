import 'package:flutter/material.dart';
import '../../domain/entities/operator.dart';
import '../../domain/entities/result_operator.dart';
import '../../domain/usescases/calculate_increase_usescases.dart';

class OperatorViewModel extends ChangeNotifier{
  final CalculateIncreaseUseCase _useCase;

  OperatorViewModel(this._useCase);

  ResultOperator? result;

  ResultOperator calculate(double salary, double antique){
    final operator = Operator(salary: salary, antique: antique);
    result = _useCase.execute(operator);
    notifyListeners();
    return result!;   //! asegura que el valor no sea nulo
  }

}