
import 'package:core_app/app/routes/app_pages.dart';
import 'package:core_app/app/screens/auth/bindings/authBinding.dart';
import 'package:core_app/app/screens/profile/bindings/profileBinding.dart';
import 'package:core_app/app/screens/splash/bidings/splashBidings.dart';
import 'package:core_app/core/bindings/coreBinding.dart';
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
  registers: [
    CoreBindings(),
    AuthRBindings(),
    ProfileBinding(),
    SplashRegister(),
  ],
),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}