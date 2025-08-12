import 'package:flutter/material.dart';
import 'package:proyecto_final/models/medicamento.dart';

class DetalleMedicamento extends StatelessWidget {
  const DetalleMedicamento({super.key, required this.medicamento});
    final Medicamento medicamento;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(medicamento.nombre)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              medicamento.descripcion,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Horas de toma:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: medicamento.horas.length,
                itemBuilder: (context, index) {
                  final hora = medicamento.horas[index];
                  return ListTile(
                    leading: const Icon(Icons.access_time, color: Colors.blue),
                    title: Text(
                      '${hora.hour.toString()}:${hora.minute.toString()}     ${hora.day}/${hora.month}/${hora.year}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}