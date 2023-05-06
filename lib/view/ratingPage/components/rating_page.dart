import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constants.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(412, 915));
    return Scaffold(
      backgroundColor: BaseColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenUtil().setHeight(180)),
        child: AppBar(
          backgroundColor: YellowColor,
          automaticallyImplyLeading: false,
          flexibleSpace: Stack( // changed
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
                        'ثبت امتیاز',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: BlackColor,
                          fontFamily: "IranSansWeb",
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
            child: InkWell( // added InkWell to make it clickable
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
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 45, 0, 0),
                child: Image.asset(
                  RatingLogo,
                  width: 148.44,
                  height: 82.53,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              'امتیاز به سفارش',
              style:  TextStyle(
                color: BlackColor,
                fontFamily: "IranSansWeb",
                fontSize: ScreenUtil().setSp(22),
                fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
              child: Container(
                width: 312,
                height: 169,
                decoration: BoxDecoration(
                  color: const Color(0xFFEBEBEB),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text(
                            'به سفارشتان چه امتیازی می دهید؟',
                            style:  TextStyle(
                              color: const Color(0xFF5E5D5D),
                              fontFamily: "IranSansWeb",
                              fontSize: ScreenUtil().setSp(16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(35, 0, 50, 70),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.star_outlined,
                                  color: BlackColor,
                                  size: 50,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.star_outlined,
                                  color: BlackColor,
                                  size: 50,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.star_outlined,
                                  color: BlackColor,
                                  size: 50,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.star_outlined,
                                  color: BlackColor,
                                  size: 50,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.star_outlined,
                                  color: BlackColor,
                                  size: 50,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                  primary: YellowColor,
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  minimumSize: const Size(145, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: const BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                ),
                child: Text(
                  'ادامه',
                  style: TextStyle(
                    color: BlackColor,
                    fontFamily: "IranSansWeb",
                    fontSize: ScreenUtil().setSp(24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
