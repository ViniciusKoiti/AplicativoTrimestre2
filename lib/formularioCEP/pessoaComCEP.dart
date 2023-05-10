class PessoaComCepDTO {
  final String nome;
  final String cep;
  final String idade;

  PessoaComCepDTO(
      {required this.nome, required this.cep, required this.idade});

  @override
  String toString() {
    return "nome:${nome},cep:${cep},profissao:${idade}";
  }
}
