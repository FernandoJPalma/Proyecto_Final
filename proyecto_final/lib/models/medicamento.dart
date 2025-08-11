import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

final storage = GetStorage();

class Medicamento {
  // final int id;
  final String nombre;
  final String dosis;
  final String frecuencia;
  final String? descripcion;

  Medicamento({
    // required this.id,
    required this.nombre,
    required this.dosis,
    required this.frecuencia,
    this.descripcion,
  });

  factory Medicamento.fromJson(Map<String, dynamic> map) => Medicamento(
    // id: json["id"],
    nombre: map["nombre"],
    dosis: map["dosis"],
    frecuencia: map["frecuencia"],
    descripcion: map["descripcion"],
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    'nombre': nombre,
    'dosis': dosis,
    'frecuencia': frecuencia,
    'descripcion': descripcion,
  };
}

void agregarMedicamento(Medicamento nuevomd) {
  final medicamentos = obtenerMedicamento();
  if (obtenerMedicamento()==null) {
    storage.write('medicamentos', [nuevomd]);
    // print(storage.read('medicamentos'));
  }else{
    medicamentos?.add(nuevomd);
    storage.write('medicamentos', medicamentos);
  }
}

List<Medicamento>? obtenerMedicamento() {
  return storage.read('medicamentos');
}
