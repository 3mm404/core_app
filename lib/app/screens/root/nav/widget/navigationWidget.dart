import 'package:core_app/app/screens/activity/views/activityPage.dart';
import 'package:core_app/app/screens/home/views/HomePage.dart';
import 'package:core_app/app/screens/profile/views/profilePage.dart';
import 'package:core_app/app/screens/root/nav/controller/navigationControllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class Navigationwidget extends StatelessWidget {
  const Navigationwidget({super.key});

  @override
  Widget build(BuildContext context) {
 
  final controller = Get.find<NavigationController>();

   final screens = [

    const HomePage(),
    ActivityPage(),
    const Profilepage(),
   ];

   return Obx(() => Scaffold(
      body: screens[controller.selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: controller.changePage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    ));


   

   














  }
}