import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungnotibadges/controllers/app_controller.dart';

class ListNoti extends StatefulWidget {
  const ListNoti({super.key});

  @override
  State<ListNoti> createState() => _ListNotiState();
}

class _ListNotiState extends State<ListNoti> {
  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(
      init: AppController(),
      builder: (controller) => Text('This is List Noti ${controller.amountNoti.value}'),
    );
  }
}
