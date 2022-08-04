

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:reservas_flutter/app-core/model/reserva.dart';
import 'package:reservas_flutter/app-core/service/abstract_service.dart';
import 'package:reservas_flutter/app-core/service/usuario_service.dart';

class ReservaService extends AbstractService{

  Reserva parseReserva(String responseBody) {

    final parsed = json.decode(responseBody);
    print('parse ok ');
    print(parsed.toString());
    Reserva reserva = Reserva.fromMap(parsed);
    print('frommap ok ');
    return reserva;
  }


  static List<Reserva> parseReservas(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    // print(parsed);
    List<Reserva> reservas = parsed.map<Reserva>((json) => Reserva.fromMap(json)).toList();
    // print(docs);
    return reservas;
  }


  Future<List<Reserva>> getReservas() async {
    final uri =
    Uri.http(URL_API, '/visualizar-reservas');
    final response = await  client?.get(uri,
        headers: super.headers);
    if (response?.statusCode == 200) {
      //print(response?.body);


      List<Reserva> docs = parseReservas(utf8.decode(response!.body.codeUnits));

      print(docs);
      return docs;
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<List<Reserva>> getReservasQuadras() async {
    Map<String, String> queryParameters = {
      'idQuadra': UsuarioService.USUARIO_LOGADO!.idQuadra.toString(),
    };
    final uri =
    Uri.http(URL_API, '/visualizar-reservas-quadra', queryParameters);
    final response = await  client?.get(uri,
        headers: super.headers);
    if (response?.statusCode == 200) {
      //print(response?.body);


      List<Reserva> docs = parseReservas(utf8.decode(response!.body.codeUnits));

      print(docs);
      return docs;
    } else {
      throw Exception('Failed to load post');
    }
  }


}