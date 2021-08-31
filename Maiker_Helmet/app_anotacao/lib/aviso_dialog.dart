import 'package:flutter/material.dart';

avisoDialog({context, title, content}) async {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text('$title'),
      content: Text('$content'),
    ),
  );
}
