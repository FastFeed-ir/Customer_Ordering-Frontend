import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constants.dart';

class SelectTableScreen extends StatefulWidget {
  const SelectTableScreen({Key? key}) : super(key: key);

  @override
  _SelectTableScreenState createState() => _SelectTableScreenState();
}

class _SelectTableScreenState extends State<SelectTableScreen> {
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
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
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
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(56)),
                child: ElevatedButton(
                  onPressed: () {
                    
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                      ScreenUtil().setWidth(145),
                      ScreenUtil().setHeight(45),
                    ),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: YellowColor,
                  ),
                  child: Text(
                    'تایید',
                    style: TextStyle(
                      color: BlackColor,
                      fontFamily: IranSansWeb,
                      fontSize: ScreenUtil().setSp(20),
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
            ],
          ),
        ),
      ),
    );
  }
}
