// DTO = permite manipulação de dados, e gera dependencia de OO e não para mudança de tecnologia

class Contato{
  String? id;
  String? nome;
  String? telefone;
  String? email;
  String? URLAvatar;

  Contato();

  Contato.dados({
    this.id,
    this.nome,
    this.telefone,
    this.email,
    this.URLAvatar,
  });

  @override
  String toString(){
    return '''
    $id
    $telefone
    $email
  
''';
  }
}