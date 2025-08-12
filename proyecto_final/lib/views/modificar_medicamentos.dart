import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_final/controllers/medicamentos_controller.dart';
import 'package:proyecto_final/models/medicamento.dart';

class ModificarMedicamentos extends StatefulWidget {
  const ModificarMedicamentos({super.key});

  @override
  State<ModificarMedicamentos> createState() => _ModificarMedicamentosState();
}

class _ModificarMedicamentosState extends State<ModificarMedicamentos> {
  final MedicamentosController _controller = Get.find();
  int? _selectedIndex;
  Medicamento? _medicamentoSeleccionado;

  // Controladores para el formulario
  late final TextEditingController _nombreController;
  late final TextEditingController _dosisController;
  late final TextEditingController _descripcionController;
  late final TextEditingController _diasController;
  late final TextEditingController _horasController;

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController();
    _dosisController = TextEditingController();
    _descripcionController = TextEditingController();
    _diasController = TextEditingController();
    _horasController = TextEditingController();
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _dosisController.dispose();
    _descripcionController.dispose();
    _diasController.dispose();
    _horasController.dispose();
    super.dispose();
  }

  void _seleccionarMedicamento(int index) {
    setState(() {
      _selectedIndex = index;
      _medicamentoSeleccionado = _controller.medicamentos[index];
      
      // Precargar datos en los controladores
      _nombreController.text = _medicamentoSeleccionado!.nombre;
      _dosisController.text = _medicamentoSeleccionado!.dosis;
      _descripcionController.text = _medicamentoSeleccionado!.descripcion;
      _diasController.text = _medicamentoSeleccionado!.frecuencia.dias.toString();
      _horasController.text = _medicamentoSeleccionado!.frecuencia.horas.toString();
    });
  }

  void _guardarCambios() {
    if (_selectedIndex == null || _medicamentoSeleccionado == null) return;

    final medicamentoActualizado = Medicamento(
      nombre: _nombreController.text,
      dosis: _dosisController.text,
      descripcion: _descripcionController.text,
      frecuencia: Frecuencia(
        dias: int.parse(_diasController.text),
        horas: int.parse(_horasController.text),
      ),
      horas: _medicamentoSeleccionado!.horas, // Mantener horas existentes
    );

    _controller.actualizarMedicamento(_selectedIndex!, medicamentoActualizado);
    
    setState(() {
      _selectedIndex = null;
      _medicamentoSeleccionado = null;
    });

    Get.snackbar('Éxito', 'Medicamento actualizado');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Medicamentos'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Row(
        children: [
          // Panel izquierdo - Lista de medicamentos
          Expanded(
            flex: 2,
            child: Obx(
              () => ListView.builder(
                itemCount: _controller.medicamentos.length,
                itemBuilder: (context, index) {
                  final medicamento = _controller.medicamentos[index];
                  return ListTile(
                    title: Text(medicamento.nombre),
                    subtitle: Text(medicamento.dosis),
                    tileColor: _selectedIndex == index 
                        ? Colors.blue.shade100 
                        : null,
                    onTap: () => _seleccionarMedicamento(index),
                  );
                },
              ),
            ),
          ),

          // Panel derecho - Formulario de edición
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _selectedIndex != null
                  ? _buildFormularioEdicion()
                  : const Center(child: Text('Seleccione un medicamento')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormularioEdicion() {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormField(
            controller: _nombreController,
            decoration: const InputDecoration(labelText: 'Nombre del Medicamento'),
          ),
          TextFormField(
            controller: _dosisController,
            decoration: const InputDecoration(labelText: 'Dosis'),
          ),
          TextFormField(
            controller: _horasController,
            decoration: const InputDecoration(labelText: 'Horas entre dosis'),
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            controller: _diasController,
            decoration: const InputDecoration(labelText: 'Días de tratamiento'),
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            controller: _descripcionController,
            decoration: const InputDecoration(labelText: 'Descripción'),
            maxLines: 3,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _guardarCambios,
            child: const Text('Guardar Cambios'),
          ),
        ],
      ),
    );
  }
}