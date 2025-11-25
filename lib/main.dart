import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Aseguúrate que las carpetas coincidan con tus nombres de archivo reales
// Si el archivo se llama 'calculate_increase_usescases.dart', el import debe ser ese:
import 'src/domain/usescases/calculate_increase_usescases.dart';
import 'src/presentation/viewmodels/operator_viewmodel.dart';
import 'src/presentation/routes/app_routes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      // CORRECCIÓN: Usar OperatorViewModel y CalculateIncreaseUseCase (Inglés)
      create: (_) => OperatorViewModel(CalculateIncreaseUseCase()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aumento Operario',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.deepOrange,
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}