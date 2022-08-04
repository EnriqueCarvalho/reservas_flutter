import 'dart:io';

import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:reservas_flutter/app-core/model/usuario.dart';
import 'package:reservas_flutter/app-core/persistence/usuario_persistense.dart';
import 'package:reservas_flutter/app-core/service/usuario_service.dart';


class AuthInterceptor implements InterceptorContract{


  @override
  Future<RequestData> interceptRequest({required RequestData data}) async{

    if(UsuarioService.USUARIO_LOGADO != null){
      data.headers['authorization'] = 'Bearer ' + UsuarioService.USUARIO_LOGADO!.token;

    }else{
      print('********** requisição sem usuário logado **********');
    }
    return data;

  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async{
    return data;
  }
}