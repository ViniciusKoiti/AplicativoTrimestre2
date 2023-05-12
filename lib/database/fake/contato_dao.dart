import 'package:aula_2/contato_dao_interface.dart';
import 'package:aula_2/dto/contato.dart';

// Trabalho de equipe
// Isolamento de camadas
// Resolve possiveis problemas,pois quebramos a dependencia com o banco de dados
class ContatoDao implements ContatoDaoInterface {
  var listaContato = <Contato>[
    Contato.dados(
      id: '1',
      nome: 'João',
      telefone: '123456789',
      email: 'joao@example.com',
      URLAvatar: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fpt-br%2Fprocurar%2Fpessoa%2F&psig=AOvVaw2Wm6NTTQv9BaZQxXBPHRSY&ust=1683934887813000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCIiNiLi47v4CFQAAAAAdAAAAABAE',
    ),
    Contato.dados(
      id: '2',
      nome: 'Santyero',
      telefone: '987654321',
      email: 'maria@example.com',
      URLAvatar: 'https://img.ibxk.com.br/2019/02/17/17124052466014.jpg?ims=328x',
    ),
    Contato.dados(
      id: '3',
      nome: 'Pedro',
      telefone: '555555555',
      email: 'pedro@example.com',
      URLAvatar: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSj9eTbCYjJrMUKtlA0GXYqvQ-dcAp36HZWl9KPeeG9lQ&s',
    ),
  ];
  
  @override
  Future<Contato> alterar(Contato contato) {
    print(contato.toString());
    return Future.value(contato);
  }
  
  @override
  Future<Contato> buscarPorId(id) {
      return Future.value(listaContato[id-1]);
  }
  
  @override
  Future<List<Contato>> buscarTodos() {
    return Future.value(listaContato);
  }
  
  @override
  Future<bool> excluir(id) {
    // TODO: implement excluir
    throw UnimplementedError();
  }
  
  @override
  Future<Contato> salvar(Contato contato) {
    // TODO: implement salvar
    throw UnimplementedError();
  }

 
}
