import 'package:flutter/material.dart';

import 'app_controller.dart';

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDark,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
