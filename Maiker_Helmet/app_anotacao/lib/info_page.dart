import 'package:app_anotacao/app_controller.dart';
import 'package:flutter/material.dart';

import 'custom_switch.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  String tittleAnotacao = "";
  String textAnotacao = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações do desenvolvedor'),
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
                Image.network(
                  'https://media.discordapp.net/attachments/692576435482918925/882337793865551912/20190724_221325.jpg',
                  height: 256,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Maiker Helmet Maria de Oliveira",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Cursando ADS - Analise e Desenvolvimento de Sistema",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Disciplina: Dispositivos Movéis",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
