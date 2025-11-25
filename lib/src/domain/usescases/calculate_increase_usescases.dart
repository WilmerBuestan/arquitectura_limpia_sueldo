import '../entities/operator.dart';
import '../entities/result_operator.dart';

class CalculateIncreaseUseCase{
  ResultOperator execute(Operator op){
    double increase = 0;
    //logica del aumento
    if(op.salary < 500){
      if(op.antique >= 10){
        increase = op.salary * 0.2;

      }else{
        increase = op.salary * 0.05;
      }

    }

    final finalSalary = op.salary + increase;

    return ResultOperator(increase: increase, salary: finalSalary);
  }
}


