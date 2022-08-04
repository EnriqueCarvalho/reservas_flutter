import 'dart:ffi';

import 'package:reservas_flutter/app-core/model/quadra.dart';

class Espaco{
   int? id;
   Quadra? quadra;
   String? nome;
   int? qtdMax;
   String? descricao;
   double? valor;

//<editor-fold desc="Data Methods">

   Espaco({
    this.id,
    this.quadra,
    this.nome,
    this.qtdMax,
    this.descricao,
    this.valor,
  });

   @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Espaco &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          quadra == other.quadra &&
          nome == other.nome &&
          qtdMax == other.qtdMax &&
          descricao == other.descricao &&
          valor == other.valor);

   @override
  int get hashCode =>
      id.hashCode ^
      quadra.hashCode ^
      nome.hashCode ^
      qtdMax.hashCode ^
      descricao.hashCode ^
      valor.hashCode;

   @override
  String toString() {
    return 'Espaco{' +
        ' id: $id,' +
        ' quadra: $quadra,' +
        ' nome: $nome,' +
        ' qtdMax: $qtdMax,' +
        ' descricao: $descricao,' +
        ' valor: $valor,' +
        '}';
  }

   Espaco copyWith({
    int? id,
    Quadra? quadra,
    String? nome,
    int? qtdMax,
    String? descricao,
     double? valor,
  }) {
    return Espaco(
      id: id ?? this.id,
      quadra: quadra ?? this.quadra,
      nome: nome ?? this.nome,
      qtdMax: qtdMax ?? this.qtdMax,
      descricao: descricao ?? this.descricao,
      valor: valor ?? this.valor,
    );
  }

   Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'quadra': this.quadra,
      'nome': this.nome,
      'qtdMax': this.qtdMax,
      'descricao': this.descricao,
      'valor': this.valor,
    };
  }

  factory Espaco.fromMap(Map<String, dynamic> map) {
    return Espaco(
      id: map['id'] as int,
      quadra: Quadra.fromMap(map['quadra'])  ,
      nome: map['nome'] ,
      qtdMax: map['qtdMax'] ,
      descricao: map['descricao'] ,
      valor: map['valor'] ,
    );
  }

//</editor-fold>
}

