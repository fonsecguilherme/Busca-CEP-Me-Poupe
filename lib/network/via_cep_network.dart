import 'package:http/http.dart' as http;

import '../models/result_cep.dart';

class ViaCepNetwork {
  static Future<ResultCep> fetchCep({required String zip}) async {
    final String apiAdress = 'https://viacep.com.br/ws/$zip/json/';
    final Uri url = Uri.parse(apiAdress);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return ResultCep.fromJson(response.body);
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}
