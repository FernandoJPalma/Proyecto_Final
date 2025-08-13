import 'package:flutter/material.dart';
import 'package:proyecto_final/config/configuration_design.dart';
import 'package:proyecto_final/views/fragments/lista_medicamentos.dart';

class MostrarMedicamentos extends StatelessWidget {
  const MostrarMedicamentos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Medicamentos'),
        backgroundColor: ThemeColor().color2,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Puedes agregar widgets adicionales aquí arriba de la lista
            const SizedBox(height: 10),
            Expanded( // <-- Esto es importante para que la lista ocupe el espacio restante
              child: ListaMedicamentos(), // <-- Aquí usas tu widget de lista
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/agregar'),
        backgroundColor: ThemeColor().color2,
        child: const Icon(Icons.add, color: Colors.white),
      ),*/
    );
  }
}