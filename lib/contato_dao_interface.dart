import 'package:aula_2/dto/contato.dart';

abstract class ContatoDaoInterface{
  Future<Contato> salvar(Contato contato);
  Future<List<Contato>> buscarTodos();
  Future<Contato> buscarPorId(dynamic id);
  Future<Contato> alterar(Contato contato);
  Future<bool> excluir(dynamic id);
  
}