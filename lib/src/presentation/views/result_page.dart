import 'package:flutter/material.dart';
import '../../domain/entities/result_operator.dart';

class ResultPage extends StatelessWidget {
  // Aquí guardamos el objeto que nos mandó la página anterior
  final ResultOperator result;

  const ResultPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // La tarjeta se ajusta al contenido
                children: [
                  const Text(
                    'Resultado del Operario',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Divider(height: 30),

                  // Fila para el Aumento
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Aumento:', style: TextStyle(fontSize: 18)),
                      Text(
                        '\$ ${result.increase.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 18,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Fila para el Sueldo Final
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                          'Sueldo Final:', style: TextStyle(fontSize: 18)),
                      Text(
                        '\$ ${result.salary.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Botón para regresar
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('VOLVER A CALCULAR'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}