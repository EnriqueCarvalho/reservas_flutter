import 'package:flutter_modular/flutter_modular.dart';
import 'package:reservas_flutter/scream/cliente/nova_reserva.dart';
import 'package:reservas_flutter/scream/cliente/reservas.dart';


class AppModuleCliente extends Module{

  @override
  List<ModularRoute> get routes =>[
    ChildRoute('/', child: (context,args) => Reservas()),
    ChildRoute('/nova-reserva', child: (context,args) => NovaReserva()),

  ];

}