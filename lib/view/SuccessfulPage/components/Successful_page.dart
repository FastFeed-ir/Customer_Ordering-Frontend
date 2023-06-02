import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constants.dart';

class SuccessfulScreen extends StatefulWidget {
  const SuccessfulScreen({Key? key}) : super(key: key);

  @override
  _SuccessfulScreenState createState() => _SuccessfulScreenState();
}

class _SuccessfulScreenState extends State<SuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return GestureDetector(
      child: Scaffold(
        backgroundColor: const Color(0xFFD2E1D0),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setHeight(137)),
          child: AppBar(
            backgroundColor: RedColor,
            automaticallyImplyLeading: false,
            flexibleSpace: Stack(
              // changed
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          WhiteLogo,
                          width: ScreenUtil().setWidth(92.4),
                          height: ScreenUtil().setHeight(100),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: ScreenUtil().setHeight(10)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Image.asset(
                    SuccessfulImage,
                    width: ScreenUtil().setWidth(258),
                    height: ScreenUtil().setHeight(70),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Text(
                  'خرید موفق !',
                  style: TextStyle(
                    color: BlackColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: IranSansWeb,
                    fontSize: ScreenUtil().setSp(28),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(25, 30, 25, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'کد احراز هویت:',
                      style: TextStyle(
                        color: BlackColor,
                        fontFamily: IranSansWeb,
                        fontSize: ScreenUtil().setSp(20),
                      ),
                    ),
                    Text(
                      '123',
                      style: TextStyle(
                        color: BlackColor,
                        fontFamily: IranSansWeb,
                        fontSize: ScreenUtil().setSp(20),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 30, 0),
                child: Text(
                  '\nبرای ثبت نظر و امتیاز دادن به سفارشتون QR Code روی میز رو دوباره اسکن کنید! ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: BlackColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: IranSansWeb,
                    fontSize: ScreenUtil().setSp(20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  icon: Icon(
                    Icons.home,
                    color: BlackColor,
                    size: ScreenUtil().setSp(24),
                  ),
                  label: Text(
                    'خانه',
                    style: TextStyle(
                      color: BlackColor,
                      fontFamily: IranSansWeb,
                      fontSize: ScreenUtil().setSp(24),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: YellowColor,
                    foregroundColor: BlackColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    minimumSize: Size(
                        ScreenUtil().setWidth(145), ScreenUtil().setHeight(65)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}