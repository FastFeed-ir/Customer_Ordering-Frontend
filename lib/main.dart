import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/constants.dart';
import 'view/ScanPage/pages/ScanPage.dart';
import 'view/SelectTablePage/pages/SelectTablePage.dart';
import 'view/lendingPage/pages/LendingPage.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences prefs;
  Future<void> x() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt("StorId", 3);
    prefs.setInt("tableCount", 8);
  }

  @override
  initState() {
    x();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920.0, 1080.0),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          getPages: [
            GetPage(name: LandingPage, page: () => LandingScreen()),
            //GetPage(name: MainMenuPage, page: () => MainMenuScreen()),
            //GetPage(name: PaymentPage, page: () => PaymentScreen()),
            GetPage(name: SelectTablePage, page: () => SelectTableScreen(argument: Get.arguments)),
            //GetPage(name: SuccessfulPage, page: () => SuccessfulScreen()),
            //GetPage(name: InformationsPage, page: () => InformationsScreen()),
            //GetPage(name: CommentsPage, page: () => CommentsScreen(),),
            //GetPage(name: ScoringPage, page: () => ScoringScreen()),
            //GetPage(name: SendCommentPage, page: () => SendCommentScreen()),
            GetPage(name: ScanPage, page: () => const ScanScreen()),
          ],
          // title: 'FastFeed',

          initialRoute: LandingPage,
          // initialRoute: ScanPage, //TODO
          textDirection: TextDirection.rtl,
          defaultTransition: Transition.noTransition,
          theme: ThemeData(
            primarySwatch: RedColor.toMaterialColor(),
          ),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
        );
      },
    );
  }
}
