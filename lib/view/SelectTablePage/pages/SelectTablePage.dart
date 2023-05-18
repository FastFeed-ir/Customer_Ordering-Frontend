import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constants.dart';

class SelectTablePageScreen extends StatefulWidget {
  const SelectTablePageScreen({Key? key}) : super(key: key);

  @override
  _SelectTablePageScreenState createState() => _SelectTablePageScreenState();
}

class _SelectTablePageScreenState extends State<SelectTablePageScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return GestureDetector(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setHeight(137)),
          child: AppBar(
            backgroundColor: RedColor,
            automaticallyImplyLeading: false,
            flexibleSpace: Stack(
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
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: Text(
                    'انتخاب میز',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: BlackColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: IranSansWeb,
                    fontSize: ScreenUtil().setSp(28),
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