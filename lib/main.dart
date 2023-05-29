import 'package:customer_ordering_frontend/view/mainMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_color_gen/material_color_gen.dart';

import 'utils/constants.dart';
import 'view/search.dart';

void main() async {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920.0, 1080.0),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          getPages: [
            //GetPage(name: LandingPage, page: () => LandingScreen()),
            GetPage(name: MainMenuPage, page: () => MainMenuScreen()),
            //GetPage(name: PaymentPage, page: () => PaymentScreen()),
            //GetPage(name: SelectTablePage, page: () => SelectTableScreen()),
            //GetPage(name: SuccessfulPage, page: () => SuccessfulScreen()),
            //GetPage(name: InformationsPage, page: () => InformationsScreen()),
            //GetPage(name: CommentsPage, page: () => CommentsScreen(),),
            //GetPage(name: ScoringPage, page: () => ScoringScreen()),
            //GetPage(name: SendCommentPage, page: () => SendCommentScreen()),
            GetPage(name: SearchPage, page: () => SearchScreen()),
          ],
          // title: 'FastFeed',
          initialRoute: MainMenuPage,
          textDirection: TextDirection.rtl,
          defaultTransition: Transition.noTransition,
          theme: ThemeData(
            primarySwatch: RedColor.toMaterialColor(),
            scaffoldBackgroundColor: Colors.white
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
