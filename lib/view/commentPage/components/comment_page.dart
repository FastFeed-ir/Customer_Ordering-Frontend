import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constants.dart';

class CommentScreen extends StatefulWidget {
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return Scaffold(
        backgroundColor: BaseColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setHeight(180)),
          child: AppBar(
            backgroundColor: YellowColor,
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
                          BlackLogo,
                          width: ScreenUtil().setWidth(92.4),
                          height: ScreenUtil().setHeight(100),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: ScreenUtil().setHeight(10)),
                        Text(
                          'ثبت نظر',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: BlackColor,
                            fontFamily: IranSansWeb,
                            fontSize: ScreenUtil().setSp(24),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                    right: ScreenUtil().setWidth(30),
                    top: ScreenUtil().setHeight(130),
                    child: InkWell(
                      // added InkWell to make it clickable
                      onTap: () {
                        //TODO
                      },
                      child: const Icon(Icons.arrow_back_ios),
                    )),
              ],
            ),
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          child: Column(
            textDirection: TextDirection.rtl,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(40, 40, 40, 0),
                  child: SizedBox(
                    width: ScreenUtil().setWidth(240),
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.rtl,
                      // controller: _model.textController1,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        hintText: 'نام (اختیاری)',
                        hintStyle: TextStyle(
                          color: const Color(0xFF5E5D5D),
                          fontFamily: IranSansWeb,
                          fontSize: ScreenUtil().setSp(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF3A3A3A),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: BlackColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: BlackColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: BlackColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFEBEBEB),
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
                        prefixIcon: const Icon(
                          Icons.tag_faces_sharp,
                        ),
                      ),
                      style: TextStyle(
                        color: BlackColor,
                        fontFamily: IranSansWeb,
                        fontSize: ScreenUtil().setSp(16),
                      ),
                      // validator: _model.textController1Validator.asValidator(context),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: Container(
                    child: TextFormField(
                      textDirection: TextDirection.rtl,
                      // controller: _model.textController2,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintTextDirection:TextDirection.rtl,
                        hintText: 'نظرتان را اینجا بنویسید',
                        hintStyle: TextStyle(
                            color: const Color(0xFF5E5D5D),
                            fontFamily: IranSansWeb,
                            fontSize: ScreenUtil().setSp(16),
                            fontWeight: FontWeight.bold),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF3A3A3A),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: BlackColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: BlackColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: BlackColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFEBEBEB),
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            12, 12, 12, 12),
                      ),
                      style: TextStyle(
                        color: BlackColor,
                        fontFamily: IranSansWeb,
                        fontSize: ScreenUtil().setSp(18),
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 6,
                      maxLength: 255,
                      // validator: _model.textController2Validator.asValidator(context),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: YellowColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(144, 56),
                  ),
                  child: Text(
                    'ثبت نظر',
                    style: TextStyle(
                      color: BlackColor,
                      fontFamily: IranSansWeb,
                      fontSize: ScreenUtil().setSp(20),
                    ),
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
                    backgroundColor: RedColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(90, 36),
                  ),
                  child: Text(
                    'رد شدن',
                    style: TextStyle(
                      color: WhiteColor,
                      fontFamily: IranSansWeb,
                      fontSize: ScreenUtil().setSp(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
