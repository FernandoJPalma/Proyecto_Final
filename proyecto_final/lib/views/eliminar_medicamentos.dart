import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final/controllers/medicamentos_controller.dart';

class EliminarMedicamentos extends StatelessWidget {
  EliminarMedicamentos({super.key});

  final MedicamentosController medicamentoController = Get.find<MedicamentosController>();

  Future<void> _mostrarDialogoConfirmacion(BuildContext context, int index) async {
    final medicamento = medicamentoController.medicamentos[index];
    
    final bool? confirmado = await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar eliminación'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('¿Estás seguro de eliminar ${medicamento.nombre}?'),
                const SizedBox(height: 10),
                const Text('Esta acción no se puede deshacer.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      },
    );

    if (confirmado == true) {
      medicamentoController.removeItem(index);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${medicamento.nombre} eliminado'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eliminar Medicamentos'),
        backgroundColor: Colors.red.shade700,
        foregroundColor: Colors.white,
      ),
      body: Obx(
        () => medicamentoController.medicamentos.isEmpty
            ? const Center(
                child: Text(
                  'No hay medicamentos registrados',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(12.0),
                itemCount: medicamentoController.medicamentos.length,
                itemBuilder: (context, index) {
                  final medicamento = medicamentoController.medicamentos[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    elevation: 2,
                    child: ListTile(
                      leading: const Icon(Icons.medication, color: Colors.red),
                      title: Text(
                        medicamento.nombre,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${medicamento.dosis} • ${medicamento.frecuencia}',
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _mostrarDialogoConfirmacion(context, index),
                      ),
                      onTap: () => context.push(
                        '/detalle-medicamento',
                        extra: medicamento,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}