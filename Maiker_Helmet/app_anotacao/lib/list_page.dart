import 'package:app_anotacao/app_controller.dart';
import 'package:flutter/material.dart';
import 'custom_switch.dart';

class ListPage extends StatefulWidget {
  @override
  State<ListPage> createState() {
    return ListPageState();
  }
}

class ListPageState extends State<ListPage> {
  createListTiles(context) {
    var lista = <Widget>[];
    for (var i = 0; i < AppController.instance.listAnotacao.length; i++) {
      lista.add(createTile(
          index: i,
          title: AppController.instance.listAnotacao[i]['title'],
          text: AppController.instance.listAnotacao[i]['text'],
          context: context));
    }
    return lista;
  }

  createTile({index, title, text, context}) {
    return ListTile(
      title: Text('$title'),
      subtitle: Text('$text'),
      onTap: () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('$title'),
            content: Text('$text'),
            actions: [buttonRemove(index)],
          ),
        );
      },
    );
  }

  buttonRemove(index) {
    return TextButton(
        onPressed: () {
          AppController.instance.removeItem(index);
          Navigator.pop(context);
        },
        child: Text('Remover'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anotações'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/info");
              },
              child: Text('Infos', style: TextStyle(color: Colors.white))),
          CustomSwitch()
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: createListTiles(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add");
        },
        child: Icon(Icons.add_circle),
      ),
    );
  }
}
