import 'package:reservas_flutter/app-core/model/espaco.dart';
import 'package:reservas_flutter/app-core/model/usuario.dart';

class Reserva{

  int? id;
  String? data;
  String? hora;
  String? dataCancel;
  String? motivoCancel;
  Usuario? usuario;
  Espaco? espaco;

//<editor-fold desc="Data Methods">

  Reserva({
    this.id,
    this.data,
    this.hora,
    this.dataCancel,
    this.motivoCancel,
    this.espaco,
    this.usuario
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reserva &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          data == other.data &&
          hora == other.hora &&
          dataCancel == other.dataCancel &&
          motivoCancel == other.motivoCancel &&
          espaco == other.espaco);

  @override
  int get hashCode =>
      id.hashCode ^
      data.hashCode ^
      hora.hashCode ^
      dataCancel.hashCode ^
      motivoCancel.hashCode ^
      espaco.hashCode ^
      usuario.hashCode;

  @override
  String toString() {
    return 'Reserva{' +
        ' id: $id,' +
        ' data: $data,' +
        ' hora: $hora,' +
        ' dataCancel: $dataCancel,' +
        ' motivoCancel: $motivoCancel,' +
        ' espaco: $espaco,' +
        ' usuario: $usuario,' +
        '}';
  }

  Reserva copyWith({
    int? id,
    String? data,
    String? hora,
    String? dataCancel,
    String? motivoCancel,
    Espaco? espaco,
    Usuario? usuario,
  }) {
    return Reserva(
      id: id ?? this.id,
      data: data ?? this.data,
      hora: hora ?? this.hora,
      dataCancel: dataCancel ?? this.dataCancel,
      motivoCancel: motivoCancel ?? this.motivoCancel,
      espaco: espaco ?? this.espaco,
      usuario: usuario ?? this.usuario,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'data': this.data,
      'hora': this.hora,
      'dataCancel': this.dataCancel,
      'motivoCancel': this.motivoCancel,
      'espaco': this.espaco,
      'usuario': this.usuario,
    };
  }

  factory Reserva.fromMap(Map<String, dynamic> map) {
    return Reserva(
      id: map['id'] ,
      data: map['data'] ,
      hora: map['hora'] ,
      dataCancel: map['dataCancel'] ,
      motivoCancel: map['motivoCancel'] ,
      espaco: Espaco.fromMap(map['espaco']) ,
      usuario: Usuario.fromMap(map['usuario']) ,
    );
  }

//</editor-fold>
}