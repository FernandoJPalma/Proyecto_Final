import 'package:flutter/material.dart';

class Medicamento {
  final String nombre;
  final String dosis;
  final Frecuencia frecuencia;
  final String? descripcion;
  final List<TimeOfDay> horas;
  Medicamento({
    required this.nombre,
    required this.dosis,
    required this.frecuencia,
    required this.horas,
    this.descripcion,
  });
  static List<TimeOfDay> horasMedicamento(Frecuencia fr, TimeOfDay horaInicio) {
    int dias = fr.dias;
    int hora = fr.horas;
    int veces = 0;
    List<TimeOfDay> horasMedicamento = [];

    while (dias * 24 < veces) {
      int h = horaInicio.hour;
      int m = horaInicio.minute;
      horasMedicamento.add(TimeOfDay(hour: h + hora, minute: m));
      veces = veces + hora;
    }

    return horasMedicamento;
  }

  factory Medicamento.fromJson(Map<String, dynamic> map) => Medicamento(
    nombre: map["nombre"],
    dosis: map["dosis"],
    frecuencia: Frecuencia.fromJson(map["frecuencia"]),
    descripcion: map["descripcion"],
    horas: (map['horas'] as List).map((h) {
      final partes = h.split(':');
      return TimeOfDay(
        hour: int.parse(partes[0]),
        minute: int.parse(partes[1]),
      );
    }).toList(),
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    'nombre': nombre,
    'dosis': dosis,
    'frecuencia': frecuencia.toJson(),
    'descripcion': descripcion,
    'horas': horas
        .map(
          (h) =>
              '${h.hour.toString().padLeft(2, '0')}:${h.minute.toString().padLeft(2, '0')}',
        )
        .toList(),
  };
}

class Frecuencia {
  final int dias;
  final int horas;

  Frecuencia({required this.dias, required this.horas});

  factory Frecuencia.fromJson(Map<String, dynamic> map) =>
      Frecuencia(dias: map["dias"], horas: map["horas"]);

  Map<String, dynamic> toJson() => {
    // "id": id,
    'dias': dias,
    'horas': horas,
  };
}
