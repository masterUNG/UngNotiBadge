// ignore_for_file: sort_child_properties_last

import 'package:badges/badges.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungnotibadges/controllers/app_controller.dart';
import 'package:ungnotibadges/widgets/list_noti.dart';
import 'package:ungnotibadges/widgets/product.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var bodys = <Widget>[
    const Product(),
    const ListNoti(),
  ];
  var titles = <String>[
    'Product',
    'List Noti',
  ];
  var iconDatas = <IconData>[
    Icons.home,
    Icons.notifications,
  ];
  var bottonNavigationItems = <BottomNavigationBarItem>[];

  final getXController = Get.put(AppController());

  @override
  void initState() {
    super.initState();

    getXController.readDataFromAPI();
    aboutNoti();
  }

  Future<void> aboutNoti() async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    String? token = await firebaseMessaging.getToken();
    print('token ===> $token');

    FirebaseMessaging.onMessage.listen((event) {
      String? title = event.notification!.title;
      String? body = event.notification!.body;

      print('onMessage ===> $title. $body');
      getXController.readDataFromAPI();
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      String? title = event.notification!.title;
      String? body = event.notification!.body;

      print('onMessageOpenApp ===> $title. $body');
      getXController.readDataFromAPI();
    });
  }

  List<BottomNavigationBarItem> findItems({required int amountNoti}) {
    var result = <BottomNavigationBarItem>[];

    result.add(
      BottomNavigationBarItem(
        icon: Icon(
          iconDatas[0],
        ),
        label: titles[0],
      ),
    );

    result.add(
      BottomNavigationBarItem(
        icon: Badge(
          child: Icon(
            iconDatas[1],
          ),
          badgeContent: Text(amountNoti.toString()),
        ),
        label: titles[1],
      ),
    );

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(
      init: AppController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text('indexBody => ${controller.indexBody.value}'),
        ),
        body: bodys[controller.indexBody.value],
        bottomNavigationBar: BottomNavigationBar(
          items: findItems(amountNoti: controller.amountNoti.value),
          currentIndex: controller.indexBody.value,
          onTap: (value) {
            controller.indexBody.value = value;
          },
        ),
      ),
    );
  }
}
