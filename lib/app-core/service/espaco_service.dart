

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:reservas_flutter/app-core/model/espaco.dart';
import 'package:reservas_flutter/app-core/model/reserva.dart';
import 'package:reservas_flutter/app-core/service/abstract_service.dart';
import 'package:reservas_flutter/app-core/service/usuario_service.dart';

import '../model/funcionario.dart';

class EspacoService extends AbstractService{

  Espaco parseEspaco(String responseBody) {

    final parsed = json.decode(responseBody);
    print('parse ok ');
    print(parsed.toString());
    Espaco func = Espaco.fromMap(parsed);
    print('frommap ok ');
    return func;
  }


  static List<Espaco> parseEspacos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    // print(parsed);
    List<Espaco> funcionarios = parsed.map<Espaco>((json) => Espaco.fromMap(json)).toList();
    // print(docs);
    return funcionarios;
  }


  Future<List<Espaco>> getEspacos() async {
    Map<String, String> queryParameters = {
      'idQuadra': UsuarioService.USUARIO_LOGADO!.idQuadra.toString(),
    };
    final uri =
    Uri.http(URL_API, '/visualizar-espacos',queryParameters);
    final response = await  client?.get(uri,
        headers: super.headers);
    if (response?.statusCode == 200) {
      //print(response?.body);


      List<Espaco> docs = parseEspacos(utf8.decode(response!.body.codeUnits));

      print(docs);
      return docs;
    } else {
      throw Exception('Failed to load post');
    }
  }




}