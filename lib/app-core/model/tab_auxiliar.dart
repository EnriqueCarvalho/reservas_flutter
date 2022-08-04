import 'package:reservas_flutter/app-core/model/quadra.dart';

class TabAuxiliar{

  int? id;
  String? valorAlfa;
  int? valorNum;
  int? itemTab;
  int? codTab;
  Quadra? quadra;

//<editor-fold desc="Data Methods">

  TabAuxiliar({
    this.id,
    this.valorAlfa,
    this.valorNum,
    this.itemTab,
    this.codTab,
    this.quadra,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TabAuxiliar &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          valorAlfa == other.valorAlfa &&
          valorNum == other.valorNum &&
          itemTab == other.itemTab &&
          codTab == other.codTab &&
          quadra == other.quadra);

  @override
  int get hashCode =>
      id.hashCode ^
      valorAlfa.hashCode ^
      valorNum.hashCode ^
      itemTab.hashCode ^
      codTab.hashCode ^
      quadra.hashCode;

  @override
  String toString() {
    return 'TabAuxiliar{' +
        ' id: $id,' +
        ' valorAlfa: $valorAlfa,' +
        ' valorNum: $valorNum,' +
        ' itemTab: $itemTab,' +
        ' codTab: $codTab,' +
        ' quadra: $quadra,' +
        '}';
  }

  TabAuxiliar copyWith({
    int? id,
    String? valorAlfa,
    int? valorNum,
    int? itemTab,
    int? codTab,
    Quadra? quadra,
  }) {
    return TabAuxiliar(
      id: id ?? this.id,
      valorAlfa: valorAlfa ?? this.valorAlfa,
      valorNum: valorNum ?? this.valorNum,
      itemTab: itemTab ?? this.itemTab,
      codTab: codTab ?? this.codTab,
      quadra: quadra ?? this.quadra,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'valorAlfa': this.valorAlfa,
      'valorNum': this.valorNum,
      'itemTab': this.itemTab,
      'codTab': this.codTab,
      'quadra': this.quadra,
    };
  }

  factory TabAuxiliar.fromMap(Map<String, dynamic> map) {
    return TabAuxiliar(
      id: map['id'] as int,
      valorAlfa: map['valorAlfa'] as String,
      valorNum: map['valorNum'] as int,
      itemTab: map['itemTab'] as int,
      codTab: map['codTab'] as int,
      quadra: map['quadra'] as Quadra,
    );
  }

//</editor-fold>
}