

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:reservas_flutter/app-core/model/reserva.dart';
import 'package:reservas_flutter/app-core/service/abstract_service.dart';
import 'package:reservas_flutter/app-core/service/usuario_service.dart';

import '../model/funcionario.dart';

class FuncionarioService extends AbstractService{

  Funcionario parseFuncionario(String responseBody) {

    final parsed = json.decode(responseBody);
    print('parse ok ');
    print(parsed.toString());
    Funcionario func = Funcionario.fromMap(parsed);
    print('frommap ok ');
    return func;
  }


  static List<Funcionario> parseFuncionarios(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    // print(parsed);
    List<Funcionario> funcionarios = parsed.map<Funcionario>((json) => Funcionario.fromMap(json)).toList();
    // print(docs);
    return funcionarios;
  }


  Future<List<Funcionario>> getFuncionarios() async {
    Map<String, String> queryParameters = {
      'idQuadra': UsuarioService.USUARIO_LOGADO!.idQuadra.toString(),
    };
    final uri =
    Uri.http(URL_API, '/visualizar-funcionarios',queryParameters);
    final response = await  client?.get(uri,
        headers: super.headers);
    if (response?.statusCode == 200) {
      //print(response?.body);


      List<Funcionario> docs = parseFuncionarios(utf8.decode(response!.body.codeUnits));

      print(docs);
      return docs;
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<List<Funcionario>> getReservasQuadras() async {
    Map<String, String> queryParameters = {
      'idQuadra': UsuarioService.USUARIO_LOGADO!.idQuadra.toString(),
    };
    final uri =
    Uri.http(URL_API, '/visualizar-reservas-quadra', queryParameters);
    final response = await  client?.get(uri,
        headers: super.headers);
    if (response?.statusCode == 200) {
      //print(response?.body);


      List<Funcionario> docs = parseFuncionarios(utf8.decode(response!.body.codeUnits));

      print(docs);
      return docs;
    } else {
      throw Exception('Failed to load post');
    }
  }


}