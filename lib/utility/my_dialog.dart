// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyDialog {
  final BuildContext context;
  MyDialog({
    required this.context,
  });

  void normalDilog() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Test Dialog'),
      ),
      barrierDismissible: false,
    );
  }
}
