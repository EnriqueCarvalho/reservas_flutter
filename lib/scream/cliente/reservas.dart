import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Reservas extends StatelessWidget {

  const Reservas({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Enrique';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
            backgroundColor : Colors.green
        ),
        body: ListView(

          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Reservas ',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            ListTile(
              leading: Text('1'),
              title: Text('Minuano 02/02/2022 - 20:00'),
              subtitle: Text('Quadra 1 - Valor: R\$ 140,00'),
              trailing: SizedBox(
                width: 40,
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.remove_red_eye_outlined)),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Text('2'),
              title: Text('Dalla Favera 04/02/2022 - 20:00'),
              subtitle: Text('Churrasqueira 7 - Valor: R\$ 100,00'),
              trailing: SizedBox(
                width: 40,
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.remove_red_eye_outlined)),
                  ],
                ),
              ),
            ),

          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Modular.to.pushNamed('nova-reserva');
          },
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}