
import 'package:http_interceptor/http/http.dart';
import 'package:reservas_flutter/app-core/secutiry/auth_interceptor.dart';
import 'package:reservas_flutter/app-core/service/usuario_service.dart';

class AbstractService {

  InterceptedClient? client;

  AbstractService(){
    client = InterceptedClient.build(interceptors: [
      // LoggerInterceptor(),
      AuthInterceptor()
    ]);
  }

  final String URL_API = "192.168.0.7:8080";


  Map<String, String> headers = <String, String>{
      'X-usuario' : UsuarioService.USUARIO_LOGADO!.id.toString(),
      'Content-type': 'application/json; charset=utf-8',
  };


}