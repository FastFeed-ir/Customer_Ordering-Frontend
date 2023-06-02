import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/constants.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return GestureDetector(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(landingPage),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(65)),
                  child: Text(
                    'خوش آمدید',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: RedColor,
                      fontFamily: IranSansWeb,
                      fontSize: ScreenUtil().setSp(46),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(65),
                    ScreenUtil().setHeight(50),
                    ScreenUtil().setWidth(65),
                    0,
                  ),
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Expanded(
                      child: Flexible(
                        child: Image.asset(
                          FastfeedLogo,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(75)),
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(SelectTablePage,arguments: true);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                      ScreenUtil().setWidth(145),
                      ScreenUtil().setHeight(50),
                    ),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: RedColor,
                  ),
                  child: Text(
                    'ثبت نظر',
                    style: TextStyle(
                      color: WhiteColor,
                      fontFamily: IranSansWeb,
                      fontSize: ScreenUtil().setSp(16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(45)),
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(SelectTablePage,arguments: false);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                      ScreenUtil().setWidth(145),
                      ScreenUtil().setHeight(50),
                    ),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: RedColor,
                  ),
                  child: Text(
                    'سفارش جدید',
                    style: TextStyle(
                      color: WhiteColor,
                      fontFamily: IranSansWeb,
                      fontSize: ScreenUtil().setSp(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
