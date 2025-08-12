import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final/controllers/medicamentos_controller.dart';

class ListaMedicamentos extends StatelessWidget {
  ListaMedicamentos({super.key});

  final medicamentoController = Get.find<MedicamentosController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: medicamentoController.medicamentos.length,
        itemBuilder: (BuildContext context, int index) {
          final medicamento = medicamentoController.medicamentos[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: const Icon(Icons.medication, color: Colors.blue),
              ),
              title: Text(
                medicamento.nombre,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                '${medicamento.dosis} •  ${medicamento.frecuencia.horas.toString()} horas por ${medicamento.frecuencia.dias.toString()} dias',
              ),
              trailing: IconButton(
                onPressed: () => context.push('/detalle-medicamento', extra: medicamento),
                icon: Icon(Icons.chevron_right),
              ),
            ),
          );
        },
      ),
    );
  }
}
//  return Row(
//             children: [Column(
//               children: [
//                 Text(medicamento.nombre),
//                 Text(medicamento.dosis),
//                 Text(medicamento.descripcion ?? 'Sin descripcion'),              ],
//             ),
//             Column(
//               children: [
//                 TextButton(onPressed: (){
//                   medicamentoController.removeItem(index);
//                 }, child: Text('X',style: TextStyle(color: Colors.red))),
//                 Text(medicamento.frecuencia.dias.toString()),
//                 Text(medicamento.frecuencia.horas.toString())
//               ],
//             ),
//             ]
//           );
//         },