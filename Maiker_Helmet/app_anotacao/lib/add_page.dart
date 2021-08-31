import 'package:app_anotacao/app_controller.dart';
import 'package:flutter/material.dart';

import 'aviso_dialog.dart';
import 'custom_switch.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String tittleAnotacao = "";
  String textAnotacao = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando anotação'),
        actions: [CustomSwitch()],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (text) => tittleAnotacao = text,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Titulo da anotação',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  onChanged: (text) => textAnotacao = text,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Texto da anotação',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        ),
                        onPressed: () async {
                          if (tittleAnotacao.isNotEmpty &&
                              textAnotacao.isNotEmpty) {
                            Map<String, String> item = {
                              'title': tittleAnotacao,
                              'text': textAnotacao
                            };
                            AppController.instance.addItem(item);
                            await avisoDialog(
                                context: context,
                                title: 'Retorno',
                                content: 'Anotação feita com sucesso!');
                            Navigator.pop(context);
                          } else {
                            await avisoDialog(
                                context: context,
                                title: 'Aviso',
                                content:
                                    'Campo do titulo ou texto está vazio!');
                          }
                        },
                        child: Text(
                          'Salvar',
                          style: TextStyle(fontSize: 25),
                        )),
                    SizedBox(
                      width: 40,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancelar',
                          style: TextStyle(fontSize: 25),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
