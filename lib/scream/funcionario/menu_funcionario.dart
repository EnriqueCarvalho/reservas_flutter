
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reservas_flutter/app-core/service/reserva_service.dart';
import 'package:reservas_flutter/app-core/service/usuario_service.dart';

class MenuFuncionario extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MenuFuncionario> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Menu'),

          centerTitle: true,
          actions: <Widget>[

            Container(
              padding: EdgeInsets.only(right: 10.0),

            ),
            Container(
              padding: EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: Icon(Icons.logout),
                onPressed: ()  {

                  Modular.to.navigate('/');
                },
              ),
            ),


          ],
        ),
      body: Container(
          height: 500,
          padding: const  EdgeInsets.symmetric(vertical: 100.0),

          width: double.infinity,

          child: ListView(
            children: <Widget>[


              Container(
                  height: 100,
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: ElevatedButton.icon(
                      icon: Icon(Icons.book),
                    label: const Text('Reservas'),
                    onPressed: () async {
                      Modular.to.pushNamed('reservas');
                    }
                  )
              ), Container(
                  height: 100,
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.people),
                    label: const Text('Funcionários'),
                    onPressed: () async {
                      Modular.to.pushNamed('funcionarios');
                    }
                  )
              ), Container(
                  height: 100,
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.place),
                    label: const Text('Espaços'),
                    onPressed: () async {
                        print('espaco');
                      Modular.to.pushNamed('espacos');
                    }
                  )
              ),

            ],
          )

      ),
    );
  }
}