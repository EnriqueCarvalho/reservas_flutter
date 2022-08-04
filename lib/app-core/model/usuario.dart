
class Usuario {
  int? id;
  String? nome;
  String? email;
  String? fone;
  String? tipo;
  String? cpf;
  String? login;
  String? senha;
  String? ativo;
  String token;
  int? idQuadra;

//<editor-fold desc="Data Methods">

  Usuario({
    this.id ,
    this.nome = '',
    this.email = '',
    this.fone = '',
    this.tipo = '',
    this.cpf = '',
    this.login = '',
    this.senha = '',
    this.ativo = '',
    this.token = '',
    this.idQuadra ,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Usuario &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          nome == other.nome &&
          email == other.email &&
          fone == other.fone &&
          tipo == other.tipo &&
          cpf == other.cpf &&
          login == other.login &&
          senha == other.senha &&
          ativo == other.ativo &&
          token == other.token);

  @override
  int get hashCode =>
      id.hashCode ^
      nome.hashCode ^
      email.hashCode ^
      fone.hashCode ^
      tipo.hashCode ^
      cpf.hashCode ^
      login.hashCode ^
      senha.hashCode ^
      ativo.hashCode ^
      token.hashCode;

  @override
  String toString() {
    return 'Usuario{' +
        ' id: $id,' +
        ' nome: $nome,' +
        ' email: $email,' +
        ' fone: $fone,' +
        ' tipo: $tipo,' +
        ' cpf: $cpf,' +
        ' login: $login,' +
        ' senha: $senha,' +
        ' ativo: $ativo,' +
        ' token: $token,' +
        ' idQuadra: $idQuadra,' +
        '}';
  }

  Usuario copyWith({
    int? id,
    String? nome,
    String? email,
    String? fone,
    String? tipo,
    String? cpf,
    String? login,
    String? senha,
    String? ativo,
    String? token,
    int? idQuadra,
  }) {
    return Usuario(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      fone: fone ?? this.fone,
      tipo: tipo ?? this.tipo,
      cpf: cpf ?? this.cpf,
      login: login ?? this.login,
      senha: senha ?? this.senha,
      ativo: ativo ?? this.ativo,
      token: token ?? this.token,
      idQuadra: idQuadra ?? this.idQuadra,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'nome': this.nome,
      'email': this.email,
      'fone': this.fone,
      'tipo': this.tipo,
      'cpf': this.cpf,
      'login': this.login,
      'senha': this.senha,
      'ativo': this.ativo,
      'token': this.token,
      'idQuadra': this.idQuadra,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'] as int,
      nome: map['nome'] ,
      email: map['email'],
      fone: map['fone'] ,
      tipo: map['tipo'] ,
      cpf: map['cpf'] ,
      //login: map['login'] as String,
      //senha: map['senha'] as String,
      ativo: map['ativo'] ,
      token: map['token'] ?? '',
      idQuadra: map['idQuadra'] ,
    );
  }



//</editor-fold>
}