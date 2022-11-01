import 'package:flutter/material.dart';
import 'package:ungnotibadges/utility/my_dialog.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          MyDialog(context: context).normalDilog();

          await Future.delayed(
            const Duration(seconds: 3),
            () {
              Navigator.pop(context);
            },
          );
        },
        child: const Text('delay dialog'));
  }
}
