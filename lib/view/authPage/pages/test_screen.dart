import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants.dart';
import '../components/CommentVerifyWidget.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _unfocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        backgroundColor: BaseColor,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          title: const Text(
            'Page Title',
          ),
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: ElevatedButton(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return GestureDetector(
                            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                            child: Dialog(
                              insetPadding: MediaQuery.of(dialogContext).viewInsets,
                              child:  SizedBox(
                                height: ScreenUtil().setHeight(280),
                                width: ScreenUtil().setWidth(280),
                                child: CommentVerifyWidget(),
                              ),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      minimumSize: Size(
                          ScreenUtil().setWidth(130),
                          ScreenUtil().setHeight(40)
                      ),
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Button1'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: ElevatedButton(
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return GestureDetector(
                          onTap: () =>
                              FocusScope.of(context).requestFocus(_unfocusNode),
                          child: Dialog(
                            insetPadding:
                                MediaQuery.of(dialogContext).viewInsets,
                            // child: CommentVerifyErrorWidget(),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    minimumSize: Size(
                        ScreenUtil().setWidth(130),
                        ScreenUtil().setHeight(40)
                    ),
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Button2'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
