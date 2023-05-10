class PessoaDTO{
  final String nome;
  final String sobrenome;
  final String profissao;

  PessoaDTO({required this.nome, required this.sobrenome,required this.profissao});

  @override
  String toString() {
    return "nome:${nome},sobrenome:${sobrenome},profissao:${profissao}";
  }
}