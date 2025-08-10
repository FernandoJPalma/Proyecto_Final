
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

final storage = GetStorage();

class Medicamento {
  // final int id;
  final String nombre;
  final String dosis;
  final String frecuencia;
  final List<TimeOfDay> horarios;
  final String? descripcion;

  Medicamento({
    // required this.id,
    required this.nombre,
    required this.dosis,
    required this.frecuencia,
    required this.horarios,
    this.descripcion,
  });

  factory Medicamento.fromJson(Map<String, dynamic> map) => Medicamento(
    // id: json["id"],
    nombre: map["nombre"],
    dosis: map["dosis"],
    frecuencia: map["frecuencia"],
    horarios: map["horarios"],
    descripcion: map["descripcion"],
  );

  Map<String, dynamic> toMap() => {
    // "id": id,
    'nombre': nombre,
    'dosis': dosis,
    'frecuencia': frecuencia,
    'horarios': horarios,
    'descripcion': descripcion,
  };
}

void agregarMedicamento(Medicamento nuevomd) {
  // final getMd = storage.read('medicamentos');
  // final getMd = Medicamento.fromMap(storage.read('medicamentos')).toList();
  final medicamentos = obtenerMedicamento();
  
  print(storage.read('medicamentos'));
  if (medicamentos == null) {
    List<Medicamento> medi = [];
    medi.add(nuevomd);
    print(obtenerMedicamento());
    storage.write('medicamentos', List<Medicamento>.from(medi.map((med) => med.toMap()).toList())); 
  }
}

List<Medicamento>? obtenerMedicamento() {
  if(storage.read('medicamentos')!=null){
    final medicamentos = List<Medicamento>.from(
      storage.read('medicamentos').map(((res)=>Medicamento.fromJson(res)))
      );
     return medicamentos;
  }else {
    return null;
  }
  
}

