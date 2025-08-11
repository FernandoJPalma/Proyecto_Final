import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proyecto_final/models/medicamento.dart';

class MedicamentosController extends GetxController {
  final GetStorage _storage = GetStorage();
  final RxList<Medicamento> medicamentos = <Medicamento>[].obs;

  @override
  void onInit() {
    super.onInit();
    cargarMedicamentosLocal();
  }

  void cargarMedicamentosLocal() {
    if (_storage.read('medicamentos') != null) {
      final List<Medicamento> storedItems = List<Medicamento>.from(
        _storage.read('medicamentos').map((c)=>Medicamento.fromJson(c))
      );
      medicamentos.assignAll(storedItems);
      print(storedItems);
    }
    // print(_storage.read('medicamentos'));
  }

  void agregarMedicamento(Medicamento med) {
    print(_storage.read('medicamentos'));
    medicamentos.add(med);
    _storage.write('medicamentos', medicamentos);
    print(medicamentos);
  }
  void removeItem(int index) {
      medicamentos.removeAt(index);
      _storage.write('items', medicamentos);
    }
  // final _listaMedicamentos = <Medicamento>[].obs;
  //   void agregarMedicamento(Medicamento nuevomd) {
  //   final medicamentos = obtenerMedicamento();
  //   if (obtenerMedicamento()==null) {
  //     storage.write('medicamentos', [nuevomd]);
  //     // print(storage.read('medicamentos'));
  //   }else{
  //     medicamentos?.add(nuevomd);
  //     storage.write('medicamentos', medicamentos);
  //   }
  // }

  // List<Medicamento>? obtenerMedicamento() {
  //   return storage.read('medicamentos');
  // }
}
