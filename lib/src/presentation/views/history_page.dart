import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/operator_viewmodel.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Escuchamos al ViewModel para obtener la lista
    final viewModel = Provider.of<OperatorViewModel>(context);
    final lista = viewModel.history;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Cálculos'),
      ),
      // Si la lista está vacía, mostramos un mensaje, si no, la lista
      body: lista.isEmpty
          ? const Center(child: Text('No hay cálculos registrados aún.'))
          : ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          // Invertimos el índice para ver el más reciente primero (opcional)
          final item = lista[lista.length - 1 - index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.deepOrange),
              title: Text('Sueldo Final: \$${item.salary.toStringAsFixed(2)}'),
              subtitle: Text('Aumento recibido: \$${item.increase.toStringAsFixed(2)}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 15),
            ),
          );
        },
      ),
    );
  }
}