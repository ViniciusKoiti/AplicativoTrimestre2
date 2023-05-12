import 'package:aula_2/contato_dao_interface.dart';
import 'package:aula_2/database/fake/contato_dao.dart';
import 'package:aula_2/dto/contato.dart';
import 'package:flutter/material.dart';
import 'package:aula_2/rota.dart';
import 'package:flutter/services.dart';

class ContatoLista extends StatelessWidget {
  const ContatoLista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista Contatos')),
      body: criarLista(),
      floatingActionButton: criarBotao(context),
      bottomNavigationBar: criarBarraNavegacao(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }

  Widget criarLista() {
    ContatoDaoInterface dao = ContatoDao();
    return FutureBuilder(
      future: dao.buscarTodos(), builder: (BuildContext context, AsyncSnapshot<List<Contato>> lista) {  
        if(lista.hasData) return CircularProgressIndicator();
        if(lista.data == null) return Container();
        List<Contato> listaContato = lista.data!;
        return ListView.builder(
          itemCount: listaContato.length,
          itemBuilder: (context,indice) {
            Contato contato = listaContato[indice];
            return criarItemLista(context,contato);
          }
          );
      });
      
  }

  criarItemLista(context,contato){
    return ListTile(
      leading: Image.network(contato.URLAvatar),
      title:contato.nome,
      
    );
  }

  BottomAppBar criarBarraNavegacao(){
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Container(height: 50.0),
    );
  }

  FloatingActionButton criarBotao(BuildContext context){
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context,Rota.contatoForm),
      tooltip: 'Adicionar novo contato',
      child: const Icon(Icons.add),
    );
  }
}