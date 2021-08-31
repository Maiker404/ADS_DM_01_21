import 'package:app_anotacao/list_page.dart';
import 'package:flutter/material.dart';
import 'app_controller.dart';
import 'add_page.dart';
import 'info_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (BuildContext context, child) {
          return MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.blue,
                brightness: AppController.instance.isDark
                    ? Brightness.dark
                    : Brightness.light),
            initialRoute: '/info',
            routes: {
              '/': (context) => ListPage(),
              '/add': (context) => AddPage(),
              '/info': (context) => InfoPage(),
            },
          );
        });
  }
}
