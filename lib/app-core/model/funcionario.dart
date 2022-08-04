import 'package:reservas_flutter/app-core/model/quadra.dart';
import 'package:reservas_flutter/app-core/model/usuario.dart';

class Funcionario{

   int? id;
   String? matricula;
   String? perm;
   Quadra? quadra;
   Usuario? usuario;

//<editor-fold desc="Data Methods">

  Funcionario({
    this.id,
    this.matricula,
    this.perm,
    this.quadra,
    this.usuario,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Funcionario &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          matricula == other.matricula &&
          perm == other.perm &&
          quadra == other.quadra &&
          usuario == other.usuario);

  @override
  int get hashCode =>
      id.hashCode ^
      matricula.hashCode ^
      perm.hashCode ^
      quadra.hashCode ^
      usuario.hashCode;

  @override
  String toString() {
    return 'Funcionario{' +
        ' id: $id,' +
        ' matricula: $matricula,' +
        ' perm: $perm,' +
        ' quadra: $quadra,' +
        ' usuario: $usuario,' +
        '}';
  }

  Funcionario copyWith({
    int? id,
    String? matricula,
    String? perm,
    Quadra? quadra,
    Usuario? usuario,
  }) {
    return Funcionario(
      id: id ?? this.id,
      matricula: matricula ?? this.matricula,
      perm: perm ?? this.perm,
      quadra: quadra ?? this.quadra,
      usuario: usuario ?? this.usuario,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'matricula': this.matricula,
      'perm': this.perm,
      'quadra': this.quadra,
      'usuario': this.usuario,
    };
  }

  factory Funcionario.fromMap(Map<String, dynamic> map) {
    return Funcionario(
      id: map['id'] as int,
      matricula: map['matricula'] as String,
      perm: map['perm'] as String,
      quadra: Quadra.fromMap(map['quadra'])  ,
      usuario: Usuario.fromMap(map['usuario'])  ,
    );
  }

//</editor-fold>
}