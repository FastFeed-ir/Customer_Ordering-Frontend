import 'package:customer_ordering_frontend/view/SuccessfulPage/components/Successful_page.dart';
import 'package:customer_ordering_frontend/view/commentPage/pages/comment_page.dart';
import 'package:customer_ordering_frontend/view/mainMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utils/constants.dart';
import 'view/product_information/product_information_screen.dart';
import 'view/ratingPage/pages/rating_page.dart';
import 'view/payment/components/payment.dart';
import 'view/ScanPage/pages/ScanPage.dart';
import 'view/SelectTablePage/pages/SelectTablePage.dart';
import 'view/lendingPage/pages/LendingPage.dart';
import 'view/store_profile/store_profile_screen.dart';

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
    prefs.setInt("StorId", 22);
    prefs.setInt("tableCount", 7);
    prefs.setString("storeTitle",'عرفان');
    prefs.setDouble("ratingCount", 0);
    prefs.setInt("commentCount", 0);
    prefs.setDouble("averageRating", 0);
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
            GetPage(name: MainMenuPage, page: () => MainMenuScreen(storeId: Get.arguments,)),
            GetPage(name: PaymentPage, page: () => PaymentScreen()),
            GetPage(name: SelectTablePage, page: () => SelectTableScreen(argument: Get.arguments)),
            GetPage(name: SuccessfulPage, page: () => SuccessfulScreen()),
            GetPage(name: ProductInformationPage, page: () => ProductInformation()),
            GetPage(name: StoreProfilePage, page: () => StoreProfile()),
            GetPage(name: CommentsPage, page: () => SendCommentScreen(orderId: Get.arguments,),),
            GetPage(name: RatingPage, page: () => ScoringScreen(orderId: Get.arguments,)),
            GetPage(name: ScanPage, page: () => const ScanScreen()),
          ],
          
          initialRoute: LandingPage,
          // initialRoute: ScanPage, //TODO
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
