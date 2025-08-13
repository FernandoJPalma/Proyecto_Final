import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proyecto_final/config/noti_service.dart';
import 'package:proyecto_final/models/medicamento.dart';
import 'package:proyecto_final/models/medicamento_provider.dart';

class MedicamentosController extends GetxController {
  final GetStorage _storage = GetStorage();
  final RxList<Medicamento> medicamentos = <Medicamento>[].obs;

  @override
  void onInit() async {
    super.onInit();
    cargarMedicamentosLocal();

    try {
      final cargadoDesdeJson = _storage.read('cargadoDesdeJson') ?? false;
      if (!cargadoDesdeJson) {
        final listaMedicamentosApi = await MedicamentoProvider()
            .getMedicamentos()
            .catchError((e) {
              Get.snackbar('Error', 'Fallo al cargar desde API: $e');
              return <Medicamento>[];
            });

        if (listaMedicamentosApi.isNotEmpty) {
          cargarMedicamentosDelJson(listaMedicamentosApi);
          _storage.write('cargadoDesdeJson', true);
        }
      }
    } catch (e) {
      Get.log('Error en el onInit: $e', isError: true);
    }
    await cargarHorasApi();
  }

  Future<void> cargarHorasApi() async {
    final List<Medicamento> md = _storage.read('medicamentos');

    if (md.isNotEmpty) {
      int id = 0;

      for (final medicina in md) {
        int h = medicina.frecuencia.horas;
        int d = medicina.frecuencia.dias;
        int veces = 0;

        while (d * 24 > veces) {
          veces += h;
          await NotiService().programarNotificaciones(id, veces);
          id++;
        }
      }
    }
  }

  void cargarMedicamentosLocal() {
    if (_storage.read('medicamentos') != null) {
      final List<Medicamento> storedItems = List<Medicamento>.from(
        _storage.read('medicamentos').map((c) => Medicamento.fromJson(c)),
      );
      medicamentos.assignAll(storedItems);
    }
    // print(_storage.read('medicamentos'));
  }

  void agregarMedicamento(Medicamento med) {
    medicamentos.add(med);
    _storage.write('medicamentos', medicamentos);
  }

  void removeItem(int index) {
    medicamentos.removeAt(index);
    _storage.write('items', medicamentos);
  }

  void actualizarMedicamento(int index, Medicamento nuevosDatos) {
    if (index >= 0 && index < medicamentos.length) {
      medicamentos[index] = nuevosDatos;
      _storage.write('items', medicamentos); // Si usas almacenamiento local
      update(); // Notificar a los listeners
    }
  }

  void cargarMedicamentosDelJson(List<Medicamento> medicamentoList) {
    try {
      medicamentos.addAll(medicamentoList);
      _storage.write('medicamentos', medicamentos);
    } catch (e) {
      Get.snackbar('Error', 'No se pudieron cargar los medicamentos: $e');
      rethrow;
    }
  }
}
