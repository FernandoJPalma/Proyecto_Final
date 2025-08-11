import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_final/config/validations.dart';
import 'package:proyecto_final/controllers/medicamentos_controller.dart';
import 'package:proyecto_final/models/medicamento.dart';

class AgregarMedicamento extends StatelessWidget {
  AgregarMedicamento({super.key});
  final medicamentoController = Get.find<MedicamentosController>();
  @override
  Widget build(BuildContext context) {
    final nombreController = TextEditingController();
    final dosisController = TextEditingController();
    final frecuenciaController = TextEditingController();
    final descripcionController = TextEditingController();

    void _AgregarMedicina() {
      final Medicamento med = Medicamento(
        nombre: nombreController.text,
        dosis: dosisController.text,
        frecuencia: frecuenciaController.text,
        descripcion: descripcionController.text,
      );
      medicamentoController.agregarMedicamento(med);
    }

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey, elevation: 0),
      body: Column(
        children: [
          Text('Pagina para agregar medicamentos'),
          TextFieldBasic(
            txtController: nombreController,
            label: Text('Nombre medicina'),
            hintText: 'Ingrese el nombre de la medicina',
            // icon: Icon(Icons.email_outlined),
            kbtype: TextInputType.name,
            textError: 'Debe contener al menos 20 caracteres',
            validator: (value) {
              if (value.length < 20 && value.isNotEmpty) {
                return true;
              } else {
                return false;
              }
            },
          ),
          TextFieldBasic(
            txtController: dosisController,
            label: Text('Dosis'),
            hintText: 'Ingrese la dosis de la medicina',
            // icon: Icon(Icons.email_outlined),
            kbtype: TextInputType.name,
            textError: 'Debe contener al menos 9 caracteres',
            validator: (value) {
              if (value.length < 9 && value.isNotEmpty) {
                return true;
              } else {
                return false;
              }
            },
          ),
          TextFieldBasic(
            txtController: frecuenciaController,
            label: Text('Frecuencia'),
            hintText: 'Ingrese cada cuantas horas se debe tomar el medicamento',
            kbtype: TextInputType.number,
            textError: 'Interva lo de hora invalido',
            validator: (value) {
              if (value.length < 2 && value.isNotEmpty) {
                return true;
              } else {
                return false;
              }
            },
          ),
          TextFieldBasic(
            txtController: descripcionController,
            label: Text('Hora de inicio (Opcional)'),
            hintText:
                'Especifique la hora de inicio, si no se asigna la hora actual',
            // icon: Icon(Icons.email_outlined),
            kbtype: TextInputType.name,
            textError: 'Debe contener al menos 20 caracteres',
            validator: (value) {
              if (value.length < 20) {
                return true;
              } else {
                return false;
              }
            },
          ),
          ElevatedButton(
            onPressed: _AgregarMedicina,
            child: const Text('Agregar medicina'),
          ),
        ],
      ),
    );
  }
}
