import 'package:get/get.dart';

import '../../../utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

class CommentVerifyErrorWidget extends StatefulWidget {
  const CommentVerifyErrorWidget({Key? key}) : super(key: key);

  @override
  _CommentVerifyErrorWidgetState createState() =>
      _CommentVerifyErrorWidgetState();
}

class _CommentVerifyErrorWidgetState extends State<CommentVerifyErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
            child: Image.asset(
              ErrotLogo,
              height: ScreenUtil().setHeight(60),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
          child: Text('کد وارد شده معتبر نیست !',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: IranSansWeb,
                fontSize: ScreenUtil().setSp(16),
              )),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(LandingPage);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: YellowColor,
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    minimumSize: Size(
                        ScreenUtil().setWidth(100), ScreenUtil().setHeight(40)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'انصراف',
                    style: TextStyle(
                      fontFamily: IranSansWeb,
                      fontSize: ScreenUtil().setSp(12),
                      color: BlackColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: YellowColor,
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    minimumSize: Size(
                        ScreenUtil().setWidth(100), ScreenUtil().setHeight(40)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'تلاش  مجدد',
                    style: TextStyle(
                      fontFamily: IranSansWeb,
                      fontSize: ScreenUtil().setSp(12),
                      color: BlackColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
