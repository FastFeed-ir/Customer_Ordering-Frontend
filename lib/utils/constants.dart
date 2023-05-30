import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// Colors
const Color WhiteColor = Color(0xFFFFFFFF);
const Color BaseColor = Color(0xfff5f5f5);
const Color RedColor = Color(0xffBD271B);
const Color YellowColor = Color(0xffF5C137);
const Color BlackColor = Color(0xff000000);
const Color GreenColor = Color(0xff2CBA15);

// Pages
String LandingPage = "/landingPage";
String MainMenuPage = "/mainMenuPage";
String PaymentPage = "/PaymentPage";
String SelectTablePage = "/selectTablePage";
String SuccessfulPage = "/successfulPage";
String InformationsPage = "/informationsPage";
String CommentsPage = "/commentsPage";
String ScoringPage = "/scoringPage";
String SendCommentPage = "/sendCommentPage";
String SearchPage = "/searchPage";
//String Page = "/Page";

//Strings, Names, Address
late String Phone ;
late String Email ;
late String Address ;
late String InstagramPage ;
// Images
String FastfeedLogo = "assets/logo.png";
String Tick = "assets/Tick.png";
String Zabdar = "assets/zabdar.png";
String RestaurantLogoDef = "assets/restarauntLogo.png";
String WhiteLogo = "assets/logo_white.png";
String EmptyImg = "assets/emptyImage.png";
// Fonts
const String IranSansWeb = "IranSansWeb";
const String FugazOne = "FugazOne";

Widget titleStyle(String title) {
  return RichText(
    text: TextSpan(
      text: title,
      style: TextStyle(
        fontSize: 29.0,
        fontWeight: FontWeight.bold,
        fontFamily: IranSansWeb,
        color: BlackColor,
      ),
    ),
  );
}

ButtonStyle buttonStyle_build(double width, double height, double radius, Color color) {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(color),
    elevation: MaterialStateProperty.all<double>(0.0),
    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
    fixedSize: MaterialStateProperty.all<Size>(
      Size.fromHeight(height),
      /*Size(width, height),*/
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: BorderSide(color: BlackColor),
      ),
    ),
  );
}

Widget buildInfoDialog(BuildContext context, String? text, String? Phrase) {
  return AlertDialog(
    title: Text(text!),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[],
    ),
    actions: <Widget>[
      Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'متوجه شدم',
            style: TextStyle(
              color: BlackColor,
              fontFamily: "IranSansWeb",
              fontSize: 24.sp,
            ),
          ),
          style: buttonStyle_build(30, 30, 10, YellowColor),
        ),
      ),
    ],
  );
}

Widget loading() {
  return Container(
    padding: EdgeInsets.only(
      left: 15.0,
      top: 5.0,
      right: 15.0,
    ),
    //width: 1920.w,
    //height: 700.h,
    child: Center(
      child: SpinKitCircle(
        size: 100,
        duration: Duration(seconds: 10),
        itemBuilder: (context, index) {
          final colors = [YellowColor, RedColor];
          final color = colors[index % colors.length];
          return DecoratedBox(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          );
        },
      ),
    ),
  );
}

AppBar AppBarMenu() {
  return AppBar(
    title: Center(
      child: Image.asset(
        WhiteLogo,
        width: 50,
        height: 50,
      ),
    ),
    //actions: [],
    leading: BackButton(
      color: WhiteColor,
    ),
    backgroundColor: RedColor,
  );
}
