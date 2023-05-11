import 'package:customer_ordering_frontend/view/customerLogin/components/login&signUp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_color_gen/material_color_gen.dart';
// import 'view/informationsPage/components/informationsPage.dart';
import 'utils/constants.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
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
            //GetPage(name: MainMenuPage, page: () => MainMenuScreen()),
            //GetPage(name: PaymentPage, page: () => PaymentScreen()),
            //GetPage(name: SelectTablePage, page: () => SelectTableScreen()),
            //GetPage(name: SuccessfulPage, page: () => SuccessfulScreen()),
            //GetPage(name: InformationsPage, page: () => InformationsScreen()),
            GetPage(name: LoginSignUp, page: () => PhoneNumberScreen()),
            //GetPage(name: CommentsPage, page: () => CommentsScreen(),),
            //GetPage(name: ScoringPage, page: () => ScoringScreen()),
            //GetPage(name: SendCommentPage, page: () => SendCommentScreen()),
          ],
          // title: 'FastFeed',
          initialRoute: LandingPage,
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
