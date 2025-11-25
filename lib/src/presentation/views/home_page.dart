import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/operator_viewmodel.dart';
import '../routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controladores para capturar lo que escribe el usuario
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _antiqueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular Aumento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo para el Salario
            TextField(
              controller: _salaryController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Ingrese Salario',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.monetization_on),
              ),
            ),
            const SizedBox(height: 20),

            // Campo para la Antigüedad
            TextField(
              controller: _antiqueController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Ingrese Antigüedad (años)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calendar_today),
              ),
            ),
            const SizedBox(height: 30),

            // Botón de Calcular
            ElevatedButton(
              onPressed: () {
                // 1. Capturamos los datos
                final double salary = double.tryParse(_salaryController.text) ?? 0.0;
                final double antique = double.tryParse(_antiqueController.text) ?? 0.0;

                // 2. Llamamos al ViewModel (Provider)
                // listen: false porque aquí solo ejecutamos una acción, no escuchamos cambios
                final viewModel = Provider.of<OperatorViewModel>(context, listen: false);

                // 3. Realizamos el cálculo
                final resultadoObtenido = viewModel.calculate(salary, antique);

                // 4. Navegamos a la pantalla de resultados enviando el objeto
                Navigator.pushNamed(
                  context,
                  AppRoutes.resultOperatorRoute, // Asegúrate que coincida con tu AppRoutes
                  arguments: resultadoObtenido,
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('CALCULAR'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Buena práctica: limpiar controladores
    _salaryController.dispose();
    _antiqueController.dispose();
    super.dispose();
  }
}