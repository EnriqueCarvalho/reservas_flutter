
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reservas_flutter/app-core/service/reserva_service.dart';
import 'package:reservas_flutter/app-core/service/usuario_service.dart';

class VisualizarReservas extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<VisualizarReservas> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Reservas'),

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
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : _buildEmployeeListView(),
    floatingActionButton: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                    FloatingActionButton(
                      child: Icon(Icons.refresh),
                      onPressed: () async {
                        await _loadFromApi();
                      },
                      heroTag: null,
                    ),
                    SizedBox(height: 10,),

                ]
                )
    );
  }

  _loadFromApi() async {
    setState(() {
      isLoading = true;
    });

    var reservaService = ReservaService();
    await reservaService.getReservas();

    // wait for 2 seconds to simulate loading of data
   // await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  _deleteData() async {
    setState(() {
      isLoading = true;
    });

    //await DBProvider.db.deleteAllEmployees();

    // wait for 1 second to simulate loading of data
    //await Future.delayed(const Duration(seconds: 1));

    setState(() {
      isLoading = false;
    });

    print('All employees deleted');
  }

  _buildEmployeeListView() {
    return FutureBuilder(
      future: ReservaService().getReservas(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.black12,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                minLeadingWidth: 10,

                leading: Text(
                  "${index + 1}",
                  style: TextStyle(fontSize: 15.0),
                ),
                title: Text(
                    " ${snapshot.data[index].espaco.nome} - ${snapshot.data[index].espaco.quadra.nome} "),
                subtitle: Text(' ${snapshot.data[index].data} às ${snapshot.data[index].hora} | ${snapshot.data[index].espaco.valor } R\$'),
              );
            },

          );
        }
      },
    );
  }
}