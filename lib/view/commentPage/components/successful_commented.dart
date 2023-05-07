import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants.dart';

class SuccessfulCommentedWidget extends StatefulWidget {
  const SuccessfulCommentedWidget({Key? key}) : super(key: key);

  @override
  _SuccessfulCommentedWidgetState createState() =>
      _SuccessfulCommentedWidgetState();
}

class _SuccessfulCommentedWidgetState extends State<SuccessfulCommentedWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Image.asset(
              Tick2,
              width: ScreenUtil().setWidth(45),
              height: ScreenUtil().setHeight(45),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: Text(
            'تبریک!\n نظرتون با موفقیت ثبت شد!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: BlackColor,
              fontFamily: IranSansWeb,
              fontSize: ScreenUtil().setSp(16),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: ElevatedButton(
            onPressed: () {
              print('Button pressed ...');
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: BlackColor,
              backgroundColor: YellowColor,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              side: const BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
            ),
            child: SizedBox(
              width: ScreenUtil().setWidth(80),
              height: ScreenUtil().setHeight(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.home,
                    size: 16,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'خانه',
                    style: TextStyle(
                      fontFamily: IranSansWeb,
                      fontSize: ScreenUtil().setSp(16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
