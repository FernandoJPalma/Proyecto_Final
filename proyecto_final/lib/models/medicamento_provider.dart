import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MedicamentoProvider {
  final String _url = "https://689ae8cae727e9657f630064.mockapi.io/Medicamentos";

  Future<List<dynamic>> getMedicamentos() async {
    try {
      final response = await http.get(Uri.parse(_url)).timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw TimeoutException('Tiempo de espera agotado'),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
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

