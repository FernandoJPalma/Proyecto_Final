import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_final/config/configuration_design.dart';
import 'package:proyecto_final/config/validations.dart';
import 'package:proyecto_final/controllers/medicamentos_controller.dart';
import 'package:proyecto_final/models/medicamento.dart';

class AgregarMedicamento extends StatelessWidget {
  AgregarMedicamento({
    super.key,
    this.modoEdicion = false,
    this.medicamentoExistente,
    this.index,
  });

  final bool modoEdicion;
  final Medicamento? medicamentoExistente;
  final int? index;
  final medicamentoController = Get.find<MedicamentosController>();

  @override
  Widget build(BuildContext context) {
    // Controladores con datos iniciales si estamos editando
    final nombreController = TextEditingController(text: medicamentoExistente?.nombre ?? '');
    final dosisController = TextEditingController(text: medicamentoExistente?.dosis ?? '');
    final descripcionController = TextEditingController(text: medicamentoExistente?.descripcion ?? '');
    final diasController = TextEditingController(
        text: medicamentoExistente?.frecuencia.dias.toString() ?? '');
    final horasController = TextEditingController(
        text: medicamentoExistente?.frecuencia.horas.toString() ?? '');

    void _guardarMedicamento() {
      // Validaciones (manteniendo las existentes)
      if (nombreController.text.length < 4) {
        Get.snackbar('Error', 'Nombre demasiado corto');
        return;
      }
      if (dosisController.text.length < 9) {
        Get.snackbar('Error', 'Dosis demasiado corta');
        return;
      }
      if (horasController.text.isEmpty || int.tryParse(horasController.text) == null) {
        Get.snackbar('Error', 'Horas inválidas');
        return;
      }
      if (diasController.text.isEmpty || int.tryParse(diasController.text) == null) {
        Get.snackbar('Error', 'Días inválidos');
        return;
      }

      final fr = Frecuencia(
        dias: int.parse(diasController.text),
        horas: int.parse(horasController.text),
      );

      final medicamento = Medicamento(
        nombre: nombreController.text,
        dosis: dosisController.text,
        frecuencia: fr,
        horas: Medicamento.horasMedicamento(fr, DateTime.now()),
        descripcion: descripcionController.text,
      );

      if (modoEdicion && index != null) {
        medicamentoController.actualizarMedicamento(index!, medicamento);
        Get.snackbar('Éxito', 'Medicamento actualizado');
      } else {
        medicamentoController.agregarMedicamento(medicamento);
        Get.snackbar('Éxito', 'Medicamento agregado');
      }
      
      Get.back(); // Regresar después de guardar
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Medicamento'),
        backgroundColor: ThemeColor().color2,
        foregroundColor: ThemeColor().fuente,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Manteniendo todos tus TextFieldBasic existentes
            TextFieldBasic(
              txtController: nombreController,
              label: const Text('Nombre medicina'),
              hintText: 'Ingrese el nombre de la medicina',
              kbtype: TextInputType.name,
              textError: 'Debe contener al menos 4 caracteres',
              validator: (value) => value.length < 4 && value.isNotEmpty,
            ),
            TextFieldBasic(
              txtController: dosisController,
              label: const Text('Dosis'),
              hintText: 'Ingrese la dosis de la medicina',
              kbtype: TextInputType.name,
              textError: 'Debe contener al menos 9 caracteres',
              validator: (value) => value.length < 9 && value.isNotEmpty,
            ),
            TextFieldBasic(
              txtController: horasController,
              label: const Text('Horas'),
              hintText: 'Ingrese cada cuantas horas se debe tomar el medicamento',
              kbtype: TextInputType.number,
              textError: 'Intervalo de hora inválido',
              validator: (value) => value.length < 1 && value.isNotEmpty,
            ),
            TextFieldBasic(
              txtController: diasController,
              label: const Text('Días'),
              hintText: 'Ingrese por cuantos días tomará el medicamento',
              kbtype: TextInputType.number,
              textError: 'Intervalo de días inválido',
              validator: (value) => value.length < 2 && value.isNotEmpty,
            ),
            TextFieldBasic(
              txtController: descripcionController,
              label: const Text('Descripción (Opcional)'),
              hintText: 'Agregue una descripción del medicamento',
              kbtype: TextInputType.text,
              textError: 'Descripción demasiado corta',
              validator: (value) => value.length < 20 && value.isNotEmpty,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _guardarMedicamento,
              style: ElevatedButton.styleFrom(
                backgroundColor: ThemeColor().color2,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(
                modoEdicion ? 'Actualizar Medicina' : 'Agregar Medicina',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}