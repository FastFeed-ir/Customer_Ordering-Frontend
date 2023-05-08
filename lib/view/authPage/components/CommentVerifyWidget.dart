import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import 'CommentVerifyErrorWidget.dart';

class CommentVerifyWidget extends StatefulWidget {
  const CommentVerifyWidget({Key? key}) : super(key: key);

  @override
  _CommentVerifyWidgetState createState() => _CommentVerifyWidgetState();
}

class _CommentVerifyWidgetState extends State<CommentVerifyWidget> {
  String pincode = '';
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
              VerifyLogo,
              width: ScreenUtil().setWidth(60),
              height: ScreenUtil().setHeight(60),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
          child: Text('لطفا کد احراز هویت خود را وارد کنید',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: IranSansWeb,
                fontSize: ScreenUtil().setSp(16),
              )),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(45, 15, 45, 0),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: PinCodeTextField(
              autoDisposeControllers: false,
              appContext: context,
              length: 3,
              textStyle: TextStyle(
                fontFamily: IranSansWeb,
                fontSize: ScreenUtil().setSp(16),
              ),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              enableActiveFill: false,
              autoFocus: true,
              enablePinAutofill: false,
              errorTextSpace: 16,
              showCursor: true,
              cursorColor: BlackColor,
              obscureText: false,
              pinTheme: PinTheme(
                fieldHeight: 35,
                fieldWidth: 35,
                borderWidth: 2,
                borderRadius: BorderRadius.circular(12),
                shape: PinCodeFieldShape.box,
                activeColor: YellowColor,
                inactiveColor: BlackColor,
                selectedColor: RedColor,
                activeFillColor: YellowColor,
                inactiveFillColor: BlackColor,
                selectedFillColor: RedColor,
              ),
              // controller: _model.pinCodeController,
              onChanged: (value) {
                setState(() {
                  pincode = value;
                });
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,

              // validator: (v) {
              //   if (v?.length != 3) {
              //     return "لطفا کد احراز هویت را به درستی وارد کنید";
              //   } else {
              //     return null;
              //   }
              //  },
              //   onCompleted: (v) {
              //     print(v);
              //   }
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: ElevatedButton(
            onPressed: () async {
              if (pincode.length != 3) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('لطفا کد احراز هویت را به درستی وارد کنید'),
                ));
                return;
              }
              // TODO
              print(pincode);
              await showDialog(
                context: context,
                builder: (dialogContext) {
                  return Dialog(
                    insetPadding: MediaQuery.of(dialogContext).viewInsets,
                    child:  SizedBox(
                      height: ScreenUtil().setHeight(240),
                      width: ScreenUtil().setWidth(280),
                      child: CommentVerifyErrorWidget(),
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: BlackColor,
              backgroundColor: YellowColor,
              minimumSize: Size(
                ScreenUtil().setWidth(80),
                ScreenUtil().setHeight(40),
              ),
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              side: BorderSide.none,
            ),
            child: Text(
              'تایید',
              style: TextStyle(
                fontFamily: IranSansWeb,
                color: BlackColor,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
