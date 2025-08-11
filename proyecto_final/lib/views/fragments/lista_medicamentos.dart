import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          return Row(
            children: [Column(
              children: [
                Text(medicamentoController.medicamentos[index].nombre),
                Text(medicamentoController.medicamentos[index].dosis),
                Text(medicamentoController.medicamentos[index].descripcion ?? 'Sin descripcion'),              ],
            ),
            Column(
              children: [
                TextButton(onPressed: (){
                  medicamentoController.removeItem(index);
                }, child: Text('X',style: TextStyle(color: Colors.red))),
                Text(medicamentoController.medicamentos[index].frecuencia)
              ],
            ),]
          );
        },
      ),
    );
  }
}
