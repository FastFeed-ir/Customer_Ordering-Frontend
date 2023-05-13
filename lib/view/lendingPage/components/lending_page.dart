import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constants.dart';

class XScreen extends StatefulWidget {
  const XScreen({Key? key}) : super(key: key);

  @override
  _XScreenState createState() => _XScreenState();
}

class _XScreenState extends State<XScreen> {
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 86, 0, 0),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 58, 0, 0),
                  child: Image.asset(
                    FastfeedLogo,
                    width: 214,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 75, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(145, 45),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: RedColor,
                    side: const BorderSide(
                      color: WhiteColor,
                      width: 1,
                    ),
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 75, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(145, 45),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: RedColor,
                    side: const BorderSide(
                      color: WhiteColor,
                      width: 1,
                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}
