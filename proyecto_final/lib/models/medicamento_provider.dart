import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:proyecto_final/models/medicamento.dart';

class MedicamentoProvider {
  final String _url =
      "https://689ae8cae727e9657f630064.mockapi.io/Medicamentos";

  Future<List<Medicamento>> getMedicamentos() async {
    try {
      final response = await http
          .get(Uri.parse(_url))
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () => throw TimeoutException('Tiempo de espera agotado'),
          );

      if (response.statusCode == 200) {
        return List<Medicamento>.from(
          json.decode(response.body).map((c) => Medicamento.fromJson(c)),
        );
      } else {
        throw HttpException('Error HTTP ${response.statusCode}');
      }
    } on SocketException {
      throw 'No hay conexión a internet';
    } on FormatException {
      throw 'Formato de respuesta inválido';
    } catch (e) {
      throw 'Error al cargar medicamentos: ${e.toString()}';
    }
  }
}
