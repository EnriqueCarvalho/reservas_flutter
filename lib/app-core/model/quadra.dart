class Quadra {
  int? id;
  String? nome;
  String? cnpj;
  String? cep;
  String? ruaEnd;
  String? bairroEnd;
  String? nroEnd;

//<editor-fold desc="Data Methods">

  Quadra({
    this.id,
    this.nome,
    this.cnpj,
    this.cep,
    this.ruaEnd,
    this.bairroEnd,
    this.nroEnd,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Quadra &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          nome == other.nome &&
          cnpj == other.cnpj &&
          cep == other.cep &&
          ruaEnd == other.ruaEnd &&
          bairroEnd == other.bairroEnd &&
          nroEnd == other.nroEnd);

  @override
  int get hashCode =>
      id.hashCode ^
      nome.hashCode ^
      cnpj.hashCode ^
      cep.hashCode ^
      ruaEnd.hashCode ^
      bairroEnd.hashCode ^
      nroEnd.hashCode;

  @override
  String toString() {
    return 'Quadra{' +
        ' id: $id,' +
        ' nome: $nome,' +
        ' cnpj: $cnpj,' +
        ' cep: $cep,' +
        ' ruaEnd: $ruaEnd,' +
        ' bairroEnd: $bairroEnd,' +
        ' nroEnd: $nroEnd,' +
        '}';
  }

  Quadra copyWith({
    int? id,
    String? nome,
    String? cnpj,
    String? cep,
    String? ruaEnd,
    String? bairroEnd,
    String? nroEnd,
  }) {
    return Quadra(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      cnpj: cnpj ?? this.cnpj,
      cep: cep ?? this.cep,
      ruaEnd: ruaEnd ?? this.ruaEnd,
      bairroEnd: bairroEnd ?? this.bairroEnd,
      nroEnd: nroEnd ?? this.nroEnd,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'nome': this.nome,
      'cnpj': this.cnpj,
      'cep': this.cep,
      'ruaEnd': this.ruaEnd,
      'bairroEnd': this.bairroEnd,
      'nroEnd': this.nroEnd,
    };
  }

  factory Quadra.fromMap(Map<String, dynamic> map) {
    return Quadra(
      id: map['id'] as int,
      nome: map['nome'] as String,
      cnpj: map['cnpj'] as String,
      cep: map['cep'] as String,
      ruaEnd: map['ruaEnd'] as String,
      bairroEnd: map['bairroEnd'] as String,
      nroEnd: map['nroEnd'] as String,
    );
  }

//</editor-fold>
}


//<editor-fold desc="Data Methods">

