
class Usuario{
  String id;
  String nome;
  String email;
  String fone;
  String tipo;
  String cpf;
  String login;
  String senha;
  String ativo;

//<editor-fold desc="Data Methods">

  Usuario({
    required this.id,
    required this.nome,
    required this.email,
    required this.fone,
    required this.tipo,
    required this.cpf,
    required this.login,
    required this.senha,
    required this.ativo,
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
          ativo == other.ativo);

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
      ativo.hashCode;

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
        '}';
  }

  Usuario copyWith({
    String? id,
    String? nome,
    String? email,
    String? fone,
    String? tipo,
    String? cpf,
    String? login,
    String? senha,
    String? ativo,
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
    );
  }

  Map<String, dynamic> toMap() {
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
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'] as String,
      nome: map['nome'] as String,
      email: map['email'] as String,
      fone: map['fone'] as String,
      tipo: map['tipo'] as String,
      cpf: map['cpf'] as String,
      login: map['login'] as String,
      senha: map['senha'] as String,
      ativo: map['ativo'] as String,
    );
  }

//</editor-fold>
}