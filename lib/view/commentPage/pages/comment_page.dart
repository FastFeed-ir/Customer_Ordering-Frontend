import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/entity/comment.dart';
import '../../../utils/constants.dart';
import '../../../view_model/comment_view_model.dart';
import '../components/successful_commented.dart';

class SendCommentScreen extends StatefulWidget {
  SendCommentScreen({Key? key, required this.orderId}) : super(key: key);
  var orderId;
  @override
  _SendCommentScreenState createState() => _SendCommentScreenState();
}

class _SendCommentScreenState extends State<SendCommentScreen> {
//form field variables
  var _orderId;
  String _name = "ناشناس";
  String _content = "";
  final _formKey = GlobalKey<FormState>();
  final _viewModel = CommentViewModel();
  final _unfocusNode = FocusNode();
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
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final double availableWidth = constraints.maxWidth;
                  final double availableHeight = constraints.maxHeight;

                  final double logoHeight = availableHeight * 0.5;
                  final double titleFontSize = availableHeight * 0.12;
                  final double backIconSize = availableHeight * 0.10;

                  return Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                BlackLogo,
                                height: logoHeight,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: availableHeight * 0.05),
                              Text(
                                'ثبت نظر',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: BlackColor,
                                  fontFamily: IranSansWeb,
                                  fontSize: titleFontSize,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        right: availableWidth * 0.10,
                        top: availableHeight * 0.72,
                        child: InkWell(
                          onTap: () {
                            // TODO: Handle back button tap
                          },
                          child: Icon(Icons.arrow_back_ios, size: backIconSize),
                        ),
                      ),
                    ],
                  );
                },
              ),
              elevation: 0.0,
            )),
        body: SafeArea(
            child: Form(
          key: _formKey,
          child: Column(
            textDirection: TextDirection.rtl,
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    ScreenUtil().setWidth(40),
                    ScreenUtil().setHeight(40),
                    ScreenUtil().setWidth(40),
                    0,
                  ),
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
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              8, 12, 8, 12),
                          prefixIcon: Icon(
                            size: ScreenUtil().setSp(20),
                            Icons.tag_faces_sharp,
                          ),
                        ),
                        style: TextStyle(
                          color: BlackColor,
                          fontFamily: IranSansWeb,
                          fontSize: ScreenUtil().setSp(16),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _name = value;
                          });
                        }
                        // validator: _model.textController1Validator.asValidator(context),
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(40),
                    ScreenUtil().setHeight(20),
                    ScreenUtil().setWidth(40),
                    0,
                  ),
                  child: TextFormField(
                    textDirection: TextDirection.rtl,
                    // controller: _model.textController2,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintTextDirection: TextDirection.rtl,
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
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    ),
                    style: TextStyle(
                      color: BlackColor,
                      fontFamily: IranSansWeb,
                      fontSize: ScreenUtil().setSp(18),
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 6,
                    maxLength: 255,
                    onChanged: (value) {
                      setState(() {
                        _content = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفا متن نظر خود را وارد کنید';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0, ScreenUtil().setHeight(40), 0, 0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_content.length < 2) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'متن نظر بیش از حد کوتاه است. لطفا حداقل 2 کارکتر بنویسید یا از دکمه رد شدن استفاده کنید.'),
                      ));
                      return;
                    }
                    _orderId = widget.orderId;
                    Comment comment = Comment(
                      content: _content,
                      orderId: _orderId,
                      name: _name,
                    );
                    _viewModel
                        .addComment(comment)
                        .asStream()
                        .listen((commentId) {
                      comment.id = commentId;
                    });
                    await showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (dialogContext) {
                          return GestureDetector(
                            onTap: () => FocusScope.of(context)
                                .requestFocus(_unfocusNode),
                            child: Dialog(
                              insetPadding:
                                  MediaQuery.of(dialogContext).viewInsets,
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: const SuccessfulCommentedWidget(),
                              ),
                            ),
                          );
                        });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: YellowColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(
                        ScreenUtil().setWidth(144), ScreenUtil().setHeight(56)),
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
                padding: EdgeInsetsDirectional.fromSTEB(
                    0, ScreenUtil().setHeight(20), 0, 0),
                child: ElevatedButton(
                  onPressed: () async {
                    await showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (dialogContext) {
                          return GestureDetector(
                            onTap: () => FocusScope.of(context)
                                .requestFocus(_unfocusNode),
                            child: Dialog(
                              insetPadding:
                                  MediaQuery.of(dialogContext).viewInsets,
                              child: SizedBox(
                                height: ScreenUtil().setHeight(200),
                                width: ScreenUtil().setWidth(240),
                                child: const SuccessfulCommentedWidget(),
                              ),
                            ),
                          );
                        });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: RedColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(
                        ScreenUtil().setWidth(90), ScreenUtil().setHeight(36)),
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
        )));
  }
}
