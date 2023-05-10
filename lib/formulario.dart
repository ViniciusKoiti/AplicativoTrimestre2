import 'package:aula_1/pessoa.dart';
import 'package:flutter/material.dart';

class Formulario extends StatelessWidget {
  var keyForm = GlobalKey<FormState>();
  var editorNome = TextEditingController();
  var editorSobrenome = TextEditingController();
  var editorProfissao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: Form(
        key: keyForm,
        child: Column(
          children: [
            TextFormField(  
              controller: editorNome,
              validator: (valorDigitado) {
                if (valorDigitado == null || valorDigitado.isEmpty) {
                  return "O campo é obrigatorio";
                }
                return null;
              },
              decoration: InputDecoration(
                  label: Text('Nome:'), hintText: 'Informe o seu nome.'),
            ),
            TextFormField(
              controller: editorSobrenome,
              validator: (valorDigitado) {
                if (valorDigitado == null || valorDigitado.isEmpty) {
                  return "O campo é obrigatorio";
                }
                return null;
              },
              decoration: InputDecoration(
                  label: Text('Sobrenome:'), hintText: 'Informe o seu sobrenome.'),
            ),
            TextFormField(
              controller: editorProfissao,
              validator: (valorDigitado) {
                if (valorDigitado == null || valorDigitado.isEmpty) {
                  return "O campo é obrigatorio";
                }
                return null;
              },
              decoration: InputDecoration(
                  label: Text('Profissao:'), hintText: 'Informe o seu Profissao.'),
            ),
            
            ElevatedButton(
              onPressed: () {
                if (keyForm.currentState!.validate()) {
                  PessoaDTO pessoa = PessoaDTO(
                      nome: editorNome.text,
                      sobrenome: editorSobrenome.text,
                      profissao: editorProfissao.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    
                       SnackBar(content: Text('${pessoa.toString()})}')));
                }
                


              },
              child: const Text("telinha"),
            ),
          ],
        ),
      ),
    );
  }
}
