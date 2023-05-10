import 'package:aula_1/formularioCEP/pessoaComCEP.dart';
import 'package:aula_1/pessoa.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormularioCep extends StatelessWidget {
  var keyForm = GlobalKey<FormState>();
  var editorCEP = TextEditingController();
  var editorCampoComNomes = TextEditingController();
  var editorOnlyNumber = TextEditingController();

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
              inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
              keyboardType: TextInputType.number,
              controller: editorCEP,
              validator: (valorDigitado) {
                if (valorDigitado == null || valorDigitado.isEmpty) {
                  return "O campo é obrigatorio";
                }
                return null;
              },
              decoration: InputDecoration(
                  label: Text('CEP:'), hintText: 'Informe o seu CEP.'),
            ),
            TextFormField(
              controller: editorCampoComNomes,
              inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[xyXY]'))],
              validator: (valorDigitado) {
                if (valorDigitado == null || valorDigitado.isEmpty) {
                  return "O campo é obrigatorio";
                }
                return null;
              },
              decoration: InputDecoration(
                  label: Text('Nome:'),
                  hintText: 'Informe o seu Nome.'),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: editorOnlyNumber,
              validator: (valorDigitado) {
                if (valorDigitado == null || valorDigitado.isEmpty) {
                  return "O campo é obrigatorio";
                }
                return null;
              },
              decoration: InputDecoration(
                  label: Text('So com numeros:'),
                  hintText: 'Informe o seus numeros.'),
            ),
           
            ElevatedButton(
              onPressed: () {
                if (keyForm.currentState!.validate()) {
                  PessoaComCepDTO pessoa = PessoaComCepDTO(
                      nome: editorCEP.text,
                      cep: editorCampoComNomes.text,
                      idade: editorOnlyNumber.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${pessoa.toString()}')));
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
