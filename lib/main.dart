import 'package:core_app/app/routes/app_pages.dart';
import 'package:core_app/app/screens/auth/bindings/auth_module.dart';
import 'package:core_app/app/screens/profile/profile_module.dart';
import 'package:core_app/app/screens/splash/module/splashModule.dart';
import 'package:core_app/core/modules/core_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kitton/kitton.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      initialBinding: KittonBinding(
        modules: [
          CoreModule(),
          AuthModule(),
          ProfileModule(),
          SplashModule(),
        ],
      ),

      initialRoute: AppRoutes.login,
      getPages: AppPages.pages,
    );
  }
}