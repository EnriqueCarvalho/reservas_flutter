import 'package:flutter_modular/flutter_modular.dart';
import 'package:reservas_flutter/scream/cliente/nova_reserva.dart';
import 'package:reservas_flutter/scream/cliente/visualizar_reservas.dart';


class AppModuleCliente extends Module{

  @override
  List<ModularRoute> get routes =>[
    ChildRoute('/', child: (context,args) => VisualizarReservas()),
    ChildRoute('/nova-reserva', child: (context,args) => NovaReserva()),

  ];

}